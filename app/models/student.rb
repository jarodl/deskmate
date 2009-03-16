class Student < ActiveRecord::Base
  has_many        :guests
  # . . .
  
  # validation stuff. . .
  validates_presence_of :name, :student_id, :room
  validates_uniqueness_of :student_id
  validate :no_more_than_four_guests
  validates_length_of :student_id,
                      :is => 9,
                      :message => "should be 9 digits"
  protected
    def no_more_than_four_guests
      errors.add(:num_of_guests, 'should be less than 5') if num_of_guests > 4
    end
end
