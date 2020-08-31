# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy all data"

InfoSyndic.destroy_all
Message.destroy_all
Chatroom.destroy_all
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

service_one = Service.create!(title: "Crêpe party", description: "Je vous propose de partager un moment convivial entre voisins autour de bonnes crêpes !", start_at: Date.today, end_at: Date.today + 3, user: maxence, category: "offer")
service_two = Service.create!(title: "Besoin d'un baby sitter", description: "Je recherche un baby-sitter pour garder ma fille ce soir à partir de 18h.", start_at: Date.today - 5, end_at: Date.today - 2, user: thomas, category: "demand")
service_three = Service.create!(title: "PSG / Bayern", description: "Open house pour venir regarder le match sur mon grand écran ! Venez avec bières et pizzas !", start_at: Date.today - 10, end_at: Date.today - 7, user: marie, category: "offer")
service_four = Service.create!(title: "Service de peinture", description: "Je vous propose mes talents de peintre pour refaire vos murs !", start_at: Date.today + 2, end_at: Date.today + 4, user: maxence, category: "offer")
service_five = Service.create!(title: "Cat-sitter", description: "En tant que grand ami des chats, je vous propose de venir garder les vôtres pendant votre absence!", start_at: Date.today - 5, end_at: Date.today, user: mickael, category: "offer")
service_six = Service.create!(title: "Qui pourrait venir nourrir mon poisson?" , description: "Je pars 2 semaines et recherche quelqu'un pour venir nourrir mon poisson rouge.", start_at: Date.today + 5, end_at: Date.today + 12, user: thomas, category: "demand")
service_seven = Service.create!(title: "Receptionner un colis", description: "Je dois recevoir un colis la semaine prochaine, quelqu'un de dispo pour le receptionner en mon abesence? ", start_at: Date.today - 1, end_at: Date.today, user: marie, category: "demand")
service_eigth = Service.create!(title: "M'aider à monter un canap'", description: "Quelqu'un de dispo pour m'aider à monter un canap Ikea? Bières en remerciement !", user: thomas, category: "demand")
service_nine = Service.create!(title: "Offre de BBsitting", description: "Ma fille de 16 ans est dispo pour garder vos enfants !", user: mickael, category: "offer")
service_ten = Service.create!(title: "Donne un lave-linge", description: "Nous changeons de lave-linge et donnons notre ancien, si cela intéresse quelqu'un!", start_at: Date.today, end_at: Date.today + 2, user: marie, category: "offer")

puts "Creating a chatroom ..."

chatroom = Chatroom.create!(guest: maxence, host: thomas)

puts "Finished"


