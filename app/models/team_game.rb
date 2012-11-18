class TeamGame < ActiveRecord::Base
  attr_accessible :game_id, :team1_id, :team2_id

    validates :game_id , :presence =>true
    validates :team_id, :presence =>true
end
