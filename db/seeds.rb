# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
require 'faker'

10.times do
  User.create!(
    email:      Faker::Hipster.words(2).join + '@' + Faker::Hipster.words(1).join + ".com",
    password:   Faker::Hipster.words(3).join,
    role:       'standard'

  )
end
users = User.all

20.times do
  Wiki.create!(
    title:     Faker::Hipster.sentence(1),
    body:      Faker::Hipster.paragraph(rand(20..40)),
    private:   false,
    user:      User.all.sample

  )
end
wikis = Wiki.all

user = User.first
user.update_attributes!(
  email:    'callitaclue@yahoo.com',
  password: 'password21',
  role:     'admin'
)


puts "Seed complete"
puts "#{Wiki.count} Wikis created"
puts "#{User.count} users created"
