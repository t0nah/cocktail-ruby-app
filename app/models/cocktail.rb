class Cocktail < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :glass, presence: true
  validates :instructions, presence: true
  validates :image_url, presence: true
end
