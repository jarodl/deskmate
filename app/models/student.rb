class Student < ActiveRecord::Base
  has_many :line_items
  
  def self.find_students_signed_in
    find(:all, :order => 'name')
  end
  
  validates_presence_of :name, :studentid, :room, :phone
  validates_uniqueness_of :name, :studentid
  #validates_format_of  :phone,
  #                     :with =>
  #                     :message => "must be in the format 555-555-5555"
  protected
  def validate
    errors.add(:studentid, "should be exactly 9 digits.") if studentid.size != 9
    errors.add(:room, "should be exactly 3 digits.") if room.size != 3
    errors.add(:phone, "should be exactly 12 digits.") if phone.size != 12
  end
end
