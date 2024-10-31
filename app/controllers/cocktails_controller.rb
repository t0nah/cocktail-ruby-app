require 'net/http'
require 'json'

class CocktailsController < ApplicationController
  def index
    all_cocktails = []

    ('a'..'z').each do |letter|
      break if all_cocktails.size >= 100  #  100 cocktails

      url = URI("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{letter}")

      # Make the API request
      response = Net::HTTP.get(url)
      data = JSON.parse(response)

      if data["drinks"]
        all_cocktails.concat(data["drinks"])
        all_cocktails = all_cocktails.take(100)
      end
    end
    @cocktails = all_cocktails
    @cocktails = Kaminari.paginate_array(all_cocktails).page(params[:page]).per(10)
  end


  def show
  end

  def search
    @query = params[:query]
    @category = params[:category]
    @cocktails = Cocktail.where('name LIKE ?', "%#{@query}%")
    render :index
  end
end
