# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Status.create([{ name: 'New' }, { name: 'In progress' }, { name: 'Done' }])

5.times do
  User.create name: Faker::Name.unique.name
end

statuses = Status.all
users = User.all

20.times do
  Task.create(
    name: Faker::Verb.base,
    description: Faker::Lorem.sentence,
    user: users.sample,
    status: statuses.sample
  )
end
