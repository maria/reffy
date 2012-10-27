class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :captain_id
      t.integer :sport_id

      t.timestamps
    end
  end
end
