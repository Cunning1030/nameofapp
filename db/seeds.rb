# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

Product.create(name: "Crass poster", description: "The nature of your oppression is the aesthetic of our anger", image_url:"crass-nature.jpg", size:"24 by 36 in", price:"10")

Product.create(name: "Dead Kennedys poster", description: "Welcome to 1984", image_url:"dk1984.jpg", size:"24 by 36 in", price:"10")

Product.create(name: "Sex Pistols poster", description: "Never mind the bans", image_url:"spnevermind.jpg", size:"24 by 36 in", price:"10")
