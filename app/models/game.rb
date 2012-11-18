class Game < ActiveRecord::Base
  attr_accessible :duration, :latitude, :longitude, :scor_team1, :scor_team2, :state
 
  #model connection with models
  has_many :teams, through: :teamgames
  belongs_to :tournament, through: :tournamentgame

  #validate data
  validates :latitude , presence: true
  validates :longitude , presence: true

  validates :scor_team1 , :presence =>true,
						 numericality: { only_integer: true }

  validates :scor_team2 , presence: true,
					 	numericality: { only_integer: true }

  validates :team1_id , presence: true
  validates :team2_id , presence: true

  validates :state, inclusion: { in: %w(on off)}
  validates :sport_id, presence: true
end
