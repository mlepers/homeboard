class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.date :start_at
      t.date :end_at
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
