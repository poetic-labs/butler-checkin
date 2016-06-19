# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

User.create(name: 'Saul Williams', email: 'saul@example.com', password: 'password', password_confirmation: 'password', start_date: '2015-03-10'.to_date)
User.create(name: 'Lorde', email: 'lorde@example.com', password: 'password', password_confirmation: 'password', start_date: '2016-05-10'.to_date)