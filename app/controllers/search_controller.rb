require 'net/http'
require 'json'

class SearchController < ApplicationController
  def index
    query = params[:query]
    url = URI("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{query}")
    response = Net::HTTP.get(url)
    data = JSON.parse(response)

    @results = data["drinks"] || []
  end
end