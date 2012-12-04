class TeamGame < ActiveRecord::Base
  attr_accessible :game_id, :team_id, :user_id

  belongs_to :game
  belongs_to :team
  belongs_to :user
  
end
