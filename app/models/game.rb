class Game < ActiveRecord::Base
  attr_accessible :duration, :latitude, :longitude, :scor_team1, :scor_team2, :team1_id, :team2_id
 
  has_many :tournament, foreign_key: 'game_id'
  belongs_to :team
end
