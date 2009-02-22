class Student < ActiveRecord::Base
  has_many :guests

  def self.find_students_signed_in
    find(:all, :order => 'name')
  end
  
  validates_presence_of :name, :student_id, :room, :phone
  validates_uniqueness_of :name, :student_id
  #validates_format_of  :phone,
  #                     :with =>
  #                     :message => "must be in the format 555-555-5555"
  protected
  def validate
    errors.add(:student_id, "should be exactly 9 digits.") if student_id.size != 9
    errors.add(:room, "should be exactly 3 digits.") if room.size != 3
    errors.add(:phone, "should be exactly 12 digits.") if phone.size != 12
    errors.add(:num_of_guests, "cannot exceed 4.") if num_of_guests > 4
  end
end
