# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)4

user = User.new
user.email = 'test4@test.com'
user.password = '123123'
user.password_confirmation = '123123'
user.role = :worker
user.first_name = 'Adm'
user.last_name = 'Bam'
user.country = 'CA'
user.birthday = '06/06/1996'
user.phone = '00000000000'
user.aboutme = 'hello'
user.skip_confirmation!
user.save!

