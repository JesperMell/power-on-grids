# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
map = Map.create({name: 'Demo'})

zones = Zone.create([
  {name: 'Undertale', map: map}, 
  {name: 'DC', map: map}, 
  {name: 'Zelda', map: map}
])

cities = City.create([
  {map: map, zone: zones[0], name:"Snowdin", coords: {x: 55, y: 60}},
  {map: map, zone: zones[0], name:"Ruins", coords: {x: 70, y: 170}},
  {map: map, zone: zones[0], name:"Waterfall", coords: {x: 240, y: 220}},
  {map: map, zone: zones[0], name:"Hotland", coords: {x: 170, y: 60}},
  {map: map, zone: zones[1], name:"Amnesty Bay", coords: {x: 450, y: 80}},
  {map: map, zone: zones[1], name:"Blue Valley", coords: {x: 350, y: 100}},
  {map: map, zone: zones[1], name:"Gotham City", coords: {x: 370, y: 230}},
  {map: map, zone: zones[1], name:"Cosmos", coords: {x: 450, y: 230}},
  {map: map, zone: zones[2], name:"Hyrule", coords: {x: 70, y: 300}},
  {map: map, zone: zones[2], name:"Wayaway", coords: {x: 150, y: 400}},
  {map: map, zone: zones[2], name:"Termina", coords: {x: 350, y: 360}},
  {map: map, zone: zones[2], name:"Rupeeland", coords: {x: 400, y: 420}}
])


connections = Connection.create([
  {map: map, city: cities[0], connected_city_id: cities[3].id, price: 15}, 
  {map: map, city: cities[0], connected_city_id: cities[1].id, price: 15}, 
  {map: map, city: cities[1], connected_city_id: cities[2].id, price: 15}, 
  {map: map, city: cities[1], connected_city_id: cities[8].id, price: 15}, 
  {map: map, city: cities[2], connected_city_id: cities[9].id, price: 15}, 
  {map: map, city: cities[2], connected_city_id: cities[6].id, price: 15}, 
  {map: map, city: cities[2], connected_city_id: cities[1].id, price: 15}, 
  {map: map, city: cities[2], connected_city_id: cities[3].id, price: 15}, 
  {map: map, city: cities[4], connected_city_id: cities[5].id, price: 15}, 
  {map: map, city: cities[4], connected_city_id: cities[2].id, price: 15}, 
  {map: map, city: cities[4], connected_city_id: cities[1].id, price: 15}, 
  {map: map, city: cities[5], connected_city_id: cities[5].id, price: 15}, 
  {map: map, city: cities[5], connected_city_id: cities[7].id, price: 15}, 
  {map: map, city: cities[7], connected_city_id: cities[10].id, price: 15}, 
  {map: map, city: cities[7], connected_city_id: cities[7].id, price: 15}, 
  {map: map, city: cities[8], connected_city_id: cities[5].id, price: 15}, 
  {map: map, city: cities[9], connected_city_id: cities[9].id, price: 15}, 
  {map: map, city: cities[10], connected_city_id: cities[10].id, price: 15}, 
  {map: map, city: cities[10], connected_city_id: cities[11].id, price: 15}, 
  {map: map, city: cities[11], connected_city_id: cities[7].id, price: 15},
  {map: map, city: cities[12], connected_city_id: cities[10].id, price: 15}, 
  {map: map, city: cities[12], connected_city_id: cities[9].id, price: 15}
])
