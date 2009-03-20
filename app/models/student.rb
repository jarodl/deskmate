class Student < ActiveRecord::Base
  has_many        :guests
  # . . .
  
  def self.search(search, page)
    paginate  :per_page => 10, :page => page,
              :conditions => ['name LIKE ? OR student_id LIKE ? OR room LIKE ?',
                               "%#{search}%", "%#{search}%", "%#{search}%"],
              :order => 'name'
  end
  
  # validation stuff. . .
  validates_presence_of :name, :student_id, :room
  validates_uniqueness_of :name, :student_id
  validates_length_of :student_id,
                      :is => 9,
                      :message => "should be 9 digits"
end
