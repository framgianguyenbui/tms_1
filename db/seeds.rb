# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
password = "qwerty"
domain = "@rails.com"

admin = User.new
admin.name = "Super User"
admin.email = "super" + domain
admin.password = password
admin.password_confirmation = password
admin.admin = true
admin.save


5.times do |n|
  name = Faker::Name.name
  email = "student-#{n+1}" + domain
  user = User.new
  user.name = name
  user.email = email
  user.password = password
  user.password_confirmation = password  
  admin.admin = false
  user.save
end
