require 'net/http'
require 'json'

class CocktailsController < ApplicationController
  def index
    all_cocktails = []

    ('a'..'z').each do |letter|
      break if all_cocktails.size >= 100

      url = URI("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{letter}")

      # Make the API request
      response = Net::HTTP.get(url)
      data = JSON.parse(response)

      if data["drinks"]
        all_cocktails.concat(data["drinks"])
        all_cocktails = all_cocktails.take(100)
      end
    end

    @cocktails = Kaminari.paginate_array(all_cocktails).page(params[:page]).per(10)
  end


  def show
    @cocktail = get_cocktail(params[:id])
  end

  def search
    redirect_to cocktails(query: params[:query])
  end

  def get_cocktail(id)
    url = URI("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{id}")
    response = Net::HTTP.get(url)
    data = JSON.parse(response)
    data["drinks"]&.first
  end
end
