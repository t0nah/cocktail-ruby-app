class AlcoholicFilter < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
