# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.email = 'test1@test.com'
user.password = '123123'
user.password_confirmation = '123123'
user.save!

user = User.new
user.email = 'test2@test.com'
user.password = '123123'
user.password_confirmation = '123123'
user.save!

user = User.new
user.email = 'test3@test.com'
user.password = '123123'
user.password_confirmation = '123123'
user.save!

job =  Job.create([{title: 'Yard Word', price:'10', description:'clean the yard', user_id: '1'},
                            {title: 'Floor Word', price: '7', description:'clean the floor', user_id: '2'},
                            {title: 'Frontend word', price: '20', description: 'design and build a website', user_id: '3'}])