class AddTeamStatusToTeams < ActiveRecord::Migration
  def change
  add_column :teams, :team_status, :boolean 
 end
end
