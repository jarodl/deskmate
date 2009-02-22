class AddTestData < ActiveRecord::Migration
  def self.up
    Student.delete_all
    Student.create(:name => 'Jarod Luebbert',
      :studentid => '800234788',
      :room => '209',
      :phone => '217-556-0353')
      
    Student.create(:name => 'Mark Sands',
      :studentid => '800120982',
      :room => '125',
      :phone => '217-556-1234')
        
    Student.create(:name => 'Jordan Kirk',
      :studentid => '800901289',
      :room => '423',
      :phone => '217-556-4312')    
  end

  def self.down
    Student.delete_all
  end
end
