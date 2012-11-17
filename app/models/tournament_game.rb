class TournamentGame < ActiveRecord::Base
  attr_accessible :game_id, :tournament_id
 
  belongs_to :tournament
  belongs_to :game
  validates :game_id , :presence =>true
  validates :team_id, :presence =>true

end
