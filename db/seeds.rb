# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cabins = [
  { name: 'Cabaña Pequeña', description: 'pequeña', price: 10_000 },
  { name: 'Cabaña Grande', description: 'grande', price: 35_000 }
]

a = []

cabins.each do |attributes|
  a << temp = Cabin.create!(attributes)
  temp.image.attach(
    io: File.open('app/assets/images/cabana2.jpg'),
    filename: 'cabana2.jpg'
  )
  puts temp.image.attached?
end

a.each do |c|
  puts c.image
end
