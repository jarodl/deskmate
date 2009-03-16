class Guest < ActiveRecord::Base
  belongs_to :students
  # . . .
  
  def student_name
    students.name if students
  end
  
  def student_name=(name)
    self.student_id = Student.find_by_name(name).id unless name.blank?
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
