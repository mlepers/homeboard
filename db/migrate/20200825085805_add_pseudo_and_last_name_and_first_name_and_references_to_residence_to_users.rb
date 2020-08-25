class AddPseudoAndLastNameAndFirstNameAndReferencesToResidenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :pseudo, :string
    add_reference :users, :residence, foreign_key: true
  end
end
