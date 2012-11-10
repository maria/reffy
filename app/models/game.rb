class Game < ActiveRecord::Base
  attr_accessible :duration, :latitude, :longitude, :scor_team1, :scor_team2, :team1_id, :team2_id, :state
 
  has_and_belongs_to_many :teams, foreign_key: 'game_id'
  has_many :tournaments, through: :tournament_games
  has_one :tournament_game, foreign_key: 'game_id'
end
