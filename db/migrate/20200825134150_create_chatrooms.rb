class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :guest, foreign_key: { to_table: 'users' }
      t.references :host, foreign_key: { to_table: 'users' }
      
      t.timestamps
    end
  end
end
