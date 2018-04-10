# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
require 'faker'
require 'random_data'

10.times do
  User.create!(
    email:      RandomData.random_email,
    password:   Faker::Hipster.words(3).join,
    role:       'standard'

  )
end
users = User.all

20.times do
  Wiki.create!(
    title:     Faker::Hipster.sentence(RandomData.random_number.to_i),
    body:      Faker::Hipster.paragraph(RandomData.random_number.to_i),
    private:   RandomData.true_or_false

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
