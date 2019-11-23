# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.email = 'adm@admin.com'
user.password = '123123'
user.password_confirmation = '123123'
user.admin = true
user.first_name = 'Adm'
user.last_name = 'Bam'
user.country = 'CA'
user.birthday = '06/06/1996'
user.phone = '00000000000'
user.aboutme = 'hello'
user.role = :owner
user.skip_confirmation!
user.save!

user = User.new
user.email = 'test1@test.com'
user.password = '123123'
user.password_confirmation = '123123'
user.role = :owner
user.first_name = 'Adm'
user.last_name = 'Bam'
user.country = 'CA'
user.phone = '00000000000'
user.birthday = '06/06/1996'
user.aboutme = 'hello'
user.skip_confirmation!
user.save!

user = User.new
user.email = 'test2@test.com'
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

user = User.new
user.email = 'test3@test.com'
user.password = '123123'
user.password_confirmation = '123123'
user.role = :owner
user.first_name = 'Adm'
user.last_name = 'Bam'
user.birthday = '06/06/1996'
user.country = 'CA'
user.phone = '00000000000'
user.aboutme = 'hello'
user.skip_confirmation!
user.save!

job = Job.new
job.title = 'Yard Work'
job.price = '10'
job.description = 'clean the yard'
job.user_id = '1'
job.status = 'available'
job.save!

job2 = Job.new
job2.title = 'Floor Work'
job2.price = '7'
job2.description = 'clean the floor'
job2.user_id = '2'
job.status = 'available'
job.save!

job2 = Job.new
job2.title = 'Frontend Work'
job2.price = '20'
job2.description = 'design and build a website'
job2.user_id = '3'
job.status = 'available'
job.save!
