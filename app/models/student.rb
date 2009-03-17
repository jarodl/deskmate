class Student < ActiveRecord::Base
  has_many        :guests
  # . . .
  
  # validation stuff. . .
  validates_presence_of :name, :student_id, :room
  validates_uniqueness_of :student_id
  validates_length_of :student_id,
                      :is => 9,
                      :message => "should be 9 digits"
end
