class CreatePlayer < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :goals

      t.timestamps
    end
  end
end
