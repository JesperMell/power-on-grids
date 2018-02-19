class City < ApplicationRecord
  belongs_to :map
  belongs_to :zone

  has_many :connections
end
