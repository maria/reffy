class AddTeamIdsToTeamgames < ActiveRecord::Migration
  def change
  	add_column :team_games, :team1_id, :integer
  	add_column :team_games, :team2_id, :integer
  	add_column :team_games, :sport_id, :integer
  end
  def down
  	remove_column :team_games, :team_id
  end
  
end
