class Guest < ActiveRecord::Base
  validates_presence_of :name, :parent_id
  validates_uniqueness_of :name
  
end
