class AddNameToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :name, :string
  end
end
