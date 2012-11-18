class TeamGame < ActiveRecord::Base
  attr_accessible :game_id, :team1_id, :team2_id, :sport_id

  belongs_to :game
  belongs_to :team

  validates :game_id , :presence =>true
  validates :team_id, :presence =>true
end
