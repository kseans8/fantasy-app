class AddAssistsToPlayers < ActiveRecord::Migration[5.0]
  def up
    add_column :players, :assists, :integer, default: 0
  end

  def down
    remove_column :players, :assists
  end
end
