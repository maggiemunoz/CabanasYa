# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# cabins = Cabin.create!([{name: 'Cabaña Pequeña', description: 'pequeña', price: 10000, image: "~/app/assets/images/cabana1"},{name: 'Cabaña Grande', description: 'grande', price: 35000}])

cabins = [
    {name: 'Cabaña Pequeña', description: 'pequeña', price: 10000},
    {name: 'Cabaña Grande', description: 'grande', price: 35000}
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


#booking = Booking.create!(start: DateTime.new(2001,2,3,4,5,6), end: DateTime.new(2001,2,3,4,5,6) , cabin: cabinss.first)

