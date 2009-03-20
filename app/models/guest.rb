class Guest < ActiveRecord::Base
  belongs_to :students
  # . . .
  
  def self.search(search, page)
    paginate  :per_page => 10, :page => page,
              :conditions => ['name LIKE ?', "%#{search}%"],
              :order => 'name'
  end
  
  def student_name
    students.name if students
  end
  
  def student_name=(name)
    student = Student.find_by_name(name)
    self.student_id = student.id unless student.nil?
  end
  
  # validation stuff. . .
  
  validates_presence_of :name
  validate :student_is_real
  
  protected
    def student_is_real
      errors.add(:student_id, 'could not be found') if Student.find_by_id(student_id).nil?
    end

end
