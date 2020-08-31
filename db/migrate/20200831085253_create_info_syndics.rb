class CreateInfoSyndics < ActiveRecord::Migration[6.0]
  def change
    create_table :info_syndics do |t|
      t.string :title
      t.text :content
      t.string :category
      t.boolean :seen
      t.references :residence, null: false, foreign_key: true
      t.timestamps
    end
  end
end
