# namespace :db do
#   desc "Erase and fill database"
#   task :populate => :environment do
#     require 'populator'
#     require 'faker'
#     
#     [Guest, Student].each(&:delete_all)
#     
#     Student.populate 20 do |student|
#       student.created_at = 2.years.ago..Time.now
#       student.name = Faker::Name.name
#       student.phone = Faker::PhoneNumber.phone_number
#     end
#     
#     
#   end
# end