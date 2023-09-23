# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require "faker"
5.times do
    User.create!(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, role: 0, phone_number: 0711223344, id_number: Faker::IDNumber.valid)
end

# User.create!(
#     email: "kwambokaj1@gmail.com",
#     password: "123456",
#     first_name: "Joy",
#     last_name: "Kwamboka",
#     role: 1,
#     phone_number: 071234567,
#     id_number: "12345678"
# )