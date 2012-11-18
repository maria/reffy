class Game < ActiveRecord::Base
  attr_accessible :duration, :latitude, :longitude, :scor_team1, :scor_team2, :state
 
  #model connection with models
  has_many :teams, through: :teamgames
  has_one :tournament, through: :tournamentgame

  #validate data
  validates :latitude , presence: true
  validates :longitude , presence: true

  validates :scor_team1 , :presence =>true,
						 numericality: { only_integer: true }

  validates :scor_team2 , presence: true,
					 	numericality: { only_integer: true }


  validates :state, inclusion: { in: %w(on off)}

end
