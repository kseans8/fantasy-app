class CreateTeam < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :rank, null: false
      t.integer :score, null: false, default: 0

      t.belongs_to :user, null: false
      t.belongs_to :league, null: false

      t.timestamps
    end
  end
end
