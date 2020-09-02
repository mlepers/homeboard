class Order < ApplicationRecord
  belongs_to :user
  belongs_to :charge
  monetize :amount_cents
end
