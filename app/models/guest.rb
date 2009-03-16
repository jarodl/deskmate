class Guest < ActiveRecord::Base
  belongs_to      :student
  # . . .
  
  def self.add_new_guest(guest)
    @student_id = Student.find_by_name(guest[:student_name].to_s).id
    @guest = Guest.new(guest)
    @guest.student_id = @student_id
  end
  
  # validation stuff. . .
  
  validates_presence_of :name, :student_id
  validate :student_id_is_valid
  
  protected
    def student_name_is_valid
      errors.add(:student_name, 'could not be found') if Student.find_by_name(student_name).nil?
    end
    def student_id_is_valid
      errors.add(:student_id, 'could not be found') if Student.find_by_id(student_id).nil?
    end
end
