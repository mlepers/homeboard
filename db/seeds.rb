# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy all data"

Comment.destroy_all
Service.destroy_all
User.destroy_all
Residence.destroy_all

puts "Creating a residence ..."

notre_residence = Residence.create!(name: "My Residence", address: "2 avenue des saules, Lille")

puts "Creating Users ..."

maxence = User.create!(first_name: "Maxence", last_name: "Lenoir", pseudo: "max", email: "maxence@lewagon.org", residence: notre_residence, password: "azerty")
marie = User.create!(first_name: "Marie", last_name: "Lepers", pseudo: "marie", email: "marie@lewagon.org", residence: notre_residence, password: "azerty")
mickael = User.create!(first_name: "Mickael", last_name: "Joseph", pseudo: "micka", email: "mickael@lewagon.org", residence: notre_residence, password: "azerty")
thomas = User.create!(first_name: "Thomas", last_name: "Quetu", pseudo: "thom", email: "thomas@lewagon.org", residence: notre_residence, password: "azerty")

puts "Creating Services ..."

service_one = Service.create!(title: "My first announce", description: "This is a db test", start_at: Date.today, end_at: Date.today + 3, user: maxence, category: "offer")
service_two = Service.create!(title: "My second announce", description: "This is another db test", start_at: Date.today - 5, end_at: Date.today - 2, user: thomas, category: "demand")
service_three = Service.create!(title: "My third announce", description: "This is the third db test", start_at: Date.today - 10, end_at: Date.today - 7, user: marie, category: "offer")
service_four = Service.create!(title: "My fourth announce", description: "This is the fourth db test", start_at: Date.today + 2, end_at: Date.today + 4, user: maxence, category: "offer")
service_five = Service.create!(title: "My fifth announce", description: "This is the fifth db test", start_at: Date.today - 5, end_at: Date.today, user: mickael, category: "offer")
service_six = Service.create!(title: "My sixth announce", description: "This is the sixth db test", start_at: Date.today + 5, end_at: Date.today + 12, user: thomas, category: "demand")
service_seven = Service.create!(title: "My seventh announce", description: "This is seventh db test", start_at: Date.today - 1, end_at: Date.today, user: marie, category: "demand")
service_eigth = Service.create!(title: "My eighth announce", description: "This is eighth db test and without date", user: thomas, category: "demand")
service_nine = Service.create!(title: "My ninth announce", description: "This is ninth db test and also without date", user: mickael, category: "offer")
service_ten = Service.create!(title: "My tenth announce", description: "This is tenth db test", start_at: Date.today, end_at: Date.today + 2, user: marie, category: "offer")

puts "Finished"


