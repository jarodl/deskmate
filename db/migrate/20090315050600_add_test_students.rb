class AddTestStudents < ActiveRecord::Migration
  def self.up
    Student.delete_all
    Student.create(:name => 'Jarod Luebbert',
      :student_id => '800234788',
      :room => '209',
      :phone => '(217) 556-0353')
    Student.create(:name => 'Nicholas Luebbert',
      :student_id => '800231288',
      :room => '213',
      :phone => '(217) 556-0125')
    Student.create(:name => 'Emily Ruppert',
      :student_id => '800234124',
      :room => '120',
      :phone => '(217) 512-1234')
    Student.create(:name => 'Mark Sands',
      :student_id => '800515388',
      :room => '412',
      :phone => '(217) 556-1240')
    Student.create(:name => 'Jordan Kirk',
      :student_id => '800124091',
      :room => '231',
      :phone => '(217) 556-1241')
  end

  def self.down
    Student.delete_all
  end
end
