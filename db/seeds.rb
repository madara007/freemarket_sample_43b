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
    Category.find_or_create_by(name: row[0].to_i)
  elsif row[2] == nil
    Category.find_or_create_by(name: row[0].to_i, parent_id: row[1].to_i)
  else
    Category.find_or_create_by(name: row[0].to_i, parent_id: row[1].to_i, group: row[2].to_i)
  end
end

CSV.foreach('db/csv/brand.csv') do |row|
  Brand.find_or_create_by(name: row[0])
end

for num in 1..46 do
  if num < 11
    Size.find_or_create_by(type: num, group: 1)
  elsif num < 27
    Size.find_or_create_by(type: num, group: 2)
  elsif num < 32
    Size.find_or_create_by(type: num, group: 3)
  elsif num < 39
    Size.find_or_create_by(type: num, group: 4)
  else
    Size.find_or_create_by(type: num, group: 5)
  end
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

100.times do |index|
  no = index + 1
  user = User.create(
    email: "email_#{no}@example.com",
    password: "#{no}password#{no}",
    nickname: "ユーザー_#{no}",
    last_name: "last_name_#{no}",
    first_name: "first_name_#{no}",
    last_name_kana: "last_name_kana_#{no}",
    first_name_kana: "first_name_kana_#{no}",
    birthday: '1900-1-1'
  )
  user.save!
end

for num in 1..100 do
  if num <= 20
    category = 1
    brand = 2440
    photo = "tmp/ladies_sample.jpg"
    category_num = category + 1 + num
  elsif num <= 40
    category = 138
    brand = 3802
    photo = "tmp/menz_sample.jpg"
    category_num = category + 1 + num - 20
  elsif num <= 60
    category = 259
    brand = 4790
    photo = "tmp/kids_sample.jpg"
    category_num = category + 1 + num - 40
  else
    category = 683
    brand = 6142
    photo = "tmp/cosmetic_sample.jpg"
    category_num = category + 1 + num - 60
  end
  Item.create!(
    name: "アイテム_" + num.to_s,
    price: num * 1000,
    description: "test",
    category_id: category_num,
    buyer_id: num,
    saler_id: num,
    shipping_date_id: 1,
    condition_id: 1,
    region_id: 1,
    delivery_fee_id: 1,
    ship_method_id: 1,
    brand_id: brand,
    size_id: 1,
    transaction: "1",
    item_photos_attributes: [
      {
        photo: open("#{Rails.root}/app/assets/images/" + photo),
        item_id: num,
      }
    ]
  )
  # ItemPhoto.create!(item_id: num, photo: open("#{Rails.root}/tmp/ladies_sample.jpg"))
end
