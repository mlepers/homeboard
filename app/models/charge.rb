class Charge < ApplicationRecord
  belongs_to :user
  monetize :price_cents
  has_many :orders
end
