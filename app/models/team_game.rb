class TeamGame < ActiveRecord::Base
  attr_accessible :game_id, :team_id, :user_id
end
