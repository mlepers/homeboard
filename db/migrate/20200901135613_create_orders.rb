class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :state
      t.string :checkout_session_id
      t.references :user, null: false, foreign_key: true
      t.references :charge, null: false, foreign_key: true
      t.monetize :amount, currency: { present: false }
      t.timestamps
    end
  end
end
