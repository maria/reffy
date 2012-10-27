class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.float :latitude
      t.float :longitude
      t.integer :scor_team1
      t.integer :scor_team2
      t.float :duration
      t.integer :team1_id
      t.integer :team2_id

      t.timestamps
    end
  end
end
