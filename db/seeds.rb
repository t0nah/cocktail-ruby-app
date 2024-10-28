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

def fetch_categories
  url = URI("https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list")
  response = Net::HTTP.get(url)
  data = JSON.parse(response)

  data["drinks"].each do |category|
    Category.create!(name: category["strCategory"])
  end
end

def fetch_glasses
  url = URI("https://www.thecocktaildb.com/api/json/v1/1/list.php?g=list")
  response = Net::HTTP.get(url)
  data = JSON.parse(response)

  data["drinks"].each do |glass|
    Glass.create!(name: glass["strGlass"])
  end
end

def fetch_ingredients
  url = URI("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
  response = Net::HTTP.get(url)
  data = JSON.parse(response)

  data["drinks"].each do |ingredient|
    Ingredient.create!(name: ingredient["strIngredient1"])
  end
end

def fetch_alcoholic_filters
  url = URI("https://www.thecocktaildb.com/api/json/v1/1/list.php?a=list")
  response = Net::HTTP.get(url)
  data = JSON.parse(response)

  data["drinks"].each do |filter|
    AlcoholicFilter.create!(name: filter["strAlcoholic"])
  end
end

fetch_categories
fetch_glasses
fetch_ingredients
fetch_alcoholic_filters