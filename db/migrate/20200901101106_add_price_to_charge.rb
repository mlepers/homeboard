class AddPriceToCharge < ActiveRecord::Migration[6.0]
  def change
    add_monetize :charges, :price, currency: { present: false }
  end
end
