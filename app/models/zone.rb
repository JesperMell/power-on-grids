class Zone < ApplicationRecord
  belongs_to :map
  has_many :cities
end
