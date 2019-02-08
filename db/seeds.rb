require "csv"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

  CSV.foreach('db/csv/category.csv') do |row|
    if row[1] == nil
      Category.create(name: row[0].to_i)
    else
      Category.create(name: row[0].to_i, parent_id: row[1].to_i)
    end
  end

for num in 1..46 do
  Size.find_or_create_by(type: num)
end

for num in 1..6 do
  Condition.find_or_create_by(type: num)
end

for num in 1..2 do
  DeliveryFee.find_or_create_by(type: num)
end

for num in 1..9 do
  ShipMethod.find_or_create_by(type: num)
end

for num in 1..48 do
  Region.find_or_create_by(name: num)
end

for num in 1..3 do
  ShippingDate.find_or_create_by(day: num)
end
