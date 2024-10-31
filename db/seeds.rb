# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'net/http'
require 'json'

# Clear existing records
Cocktail.destroy_all
Category.destroy_all
Glass.destroy_all
Ingredient.destroy_all
AlcoholicFilter.destroy_all

# Define API URLs
CATEGORY_URL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list"
GLASS_URL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?g=list"
INGREDIENT_URL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ALCOHOLIC_FILTER_URL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?a=list"

# Fetch and create categories
response = Net::HTTP.get(URI(CATEGORY_URL))
categories = JSON.parse(response)["drinks"]
categories.each do |category|
  Category.find_or_create_by!(name: category["strCategory"])
end

# Fetch and create glasses
response = Net::HTTP.get(URI(GLASS_URL))
glasses = JSON.parse(response)["drinks"]
glasses.each do |glass|
  Glass.find_or_create_by!(name: glass["strGlass"])
end

# Fetch and create ingredients
response = Net::HTTP.get(URI(INGREDIENT_URL))
ingredients = JSON.parse(response)["drinks"]
ingredients.each do |ingredient|
  Ingredient.find_or_create_by!(name: ingredient["strIngredient1"])
end

# Fetch and create alcoholic filters
response = Net::HTTP.get(URI(ALCOHOLIC_FILTER_URL))
filters = JSON.parse(response)["drinks"]
filters.each do |filter|
  AlcoholicFilter.find_or_create_by!(name: filter["strAlcoholic"])
end
