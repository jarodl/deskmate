class Guest < ActiveRecord::Base
  belongs_to :students
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
end
