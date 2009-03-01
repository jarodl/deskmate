class Guest < ActiveRecord::Base
  belongs_to :students
  
  def self.find_guests_with_form
    find(:all, :conditions => "has_form = true")
  end
  
  validates_presence_of :name, :student_id
  validates_uniqueness_of :name
  validates_numericality_of :student_id, :only_integer => true
  
  protected
  def validate
    errors.add(:student_id, "could not be found") if :student_id.nil?
  end
  
end
