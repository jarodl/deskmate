class Student < ActiveRecord::Base
  has_many :guests

  def self.find_students_with_guest
    find(:all, :conditions => ["num_of_guests > 0"])
  end
  
  validates_numericality_of :student_id, :only_integer => true
  validates_presence_of :name, :student_id, :room, :phone
  validates_uniqueness_of :name, :student_id
  validates_size_of :student_id, :is => 9
  validates_size_of :phone, :is => 12
  validates_size_of :room, :is => 3
  validates_size_of :num_of_guests, :maximum => 4
  
  #validates_format_of  :phone,
  #                     :with =>
  #                     :message => "must be in the format 555-555-5555"

end
