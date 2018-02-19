class Map < ApplicationRecord
  has_many :cities
  has_many :zones
end
