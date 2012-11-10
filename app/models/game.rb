class Game < ActiveRecord::Base
  attr_accessible :duration, :latitude, :longitude, :scor_team1, :scor_team2, :team1_id, :team2_id, :state
 
  has_many :tournament, foreign_key: 'game_id'
  has_and_belongs_to_many :teams, foreign_key: 'game_id'
end
