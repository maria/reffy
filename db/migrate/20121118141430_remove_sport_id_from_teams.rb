class RemoveSportIdFromTeams < ActiveRecord::Migration
  def up
  end

  def down
     remove_column :users, :sport_id
     remove_column :users, :team_id
  end
end
