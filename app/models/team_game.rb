class TeamGame < ActiveRecord::Base
  attr_accessible :game_id, :team1_id, :team2_id, :sport_id

  belongs_to :game
  belongs_to :team

  has_one :sport

end
