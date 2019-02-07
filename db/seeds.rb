require "csv"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

  CSV.foreach('db/category.csv') do |row|
    if row[1] == nil
      Category.create(name: row[0].to_i)
    else
      Category.create(name: row[0].to_i, parent_id: row[1].to_i)
    end
  end
