class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.date :data
      t.integer :sport_id

      t.timestamps
    end
  end
end
