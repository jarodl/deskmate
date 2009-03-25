# lib/tasks/populate.rake
namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Student].each(&:delete_all)
    
    Student.populate 100 do |student|
      student.created_at = 2.years.ago..Time.now
      student.name = Faker::Name.name
      student.phone = Faker::PhoneNumber.phone_number
      student.room = Populator.value_in_range(100..399)
      student.student_id = Populator.value_in_range(800000000..800999999)
    end
    
  end
end