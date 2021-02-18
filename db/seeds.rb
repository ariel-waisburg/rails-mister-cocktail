# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "Cleaning database..."
Ingredient.destroy_all

puts "Looking for ingredients..."
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
hash_ingredients = JSON.parse(ingredients_serialized)

ingredient = hash_ingredients['drinks']
ingredient.each do |each_ingredient|
  puts "Creating ingredient..."
  new_ingredient = Ingredient.create(name: each_ingredient['strIngredient1'])
  puts "#{new_ingredient.name} has been created"
end
