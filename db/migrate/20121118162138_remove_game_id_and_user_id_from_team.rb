class RemoveGameIdAndUserIdFromTeam < ActiveRecord::Migration
  def up
  end

  def down
  	remove_column :teams, :user_id
  	remove_column :teams, :game_id
  	remove_column :teams, :sport_id
  end
end
