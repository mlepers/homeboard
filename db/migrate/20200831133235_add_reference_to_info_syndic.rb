class AddReferenceToInfoSyndic < ActiveRecord::Migration[6.0]
  def change
    add_reference :info_syndics, :user, foreign_key: true
  end
end
