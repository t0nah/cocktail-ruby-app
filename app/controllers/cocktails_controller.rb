require 'net/http'
require 'json'

class CocktailsController < ApplicationController
  def index
    url = URI("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a") # This fetches cocktails starting with the letter "A"

    # Make the API request
    response = Net::HTTP.get(url)
    @cocktails = JSON.parse(response)["drinks"] # Store the data in an instance variable to pass to the view
  end

  def show
  end
end
