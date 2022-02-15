# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'cabanasyacorreo@gmail.com', password: ENV['DEFAUL_USER_PASS'])
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

cabins = [
  { name: 'Cabaña Pequeña',
    description: '1 dormitorio y 1 baño, perfecta para parejas que buscan relajarse.',
    price: 10_500 },
  { name: 'Cabaña Mediana',
    description: '2 dormitorios y un baño, ambiente familiar a las afueras de la ciudad',
    price: 20_000 },
  { name: 'Cabaña Grande',
    description: '3 dormitorios y 2 baños, cerca del centro y acceso facil a restaurantes y casinos',
    price: 35_000 }
]

a = []
file_names = ['cabana1.jpeg', 'cabana2.jpg', 'cabana3.jpg']
cont = 0

cabins.each do |attributes|
  a << temp = Cabin.create!(attributes)
  temp.image.attach(
    io: File.open("app/assets/images/#{file_names[cont]}"),
    filename: 'cabana2.jpg'
  )
  cont += 1
end
