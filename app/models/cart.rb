class Cart
  attr_reader :guests, :student, :max
  
  def initialize
    @guests = []
    @max = 0
    @student = nil
  end
  
  def add_guest(guest)
    if max < 4 and !student.nil?
      @guests << guest
      max += 1
    else
      nil
    end
  end
  
  def add_student(studentid)
    student = Student.find(:first, :conditions => "studentid = '#{studentid}'")
  end
  
end