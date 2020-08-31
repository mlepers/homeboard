class AddDefaultValueToInfoSyndics < ActiveRecord::Migration[6.0]
  def change
    change_column :info_syndics, :seen, :boolean, default: false
  end
end
