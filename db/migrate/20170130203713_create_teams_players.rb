class CreateTeamsPlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :teams_players do |t|
      t.belongs_to :team
      t.belongs_to :player
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
