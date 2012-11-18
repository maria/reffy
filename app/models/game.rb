class Game < ActiveRecord::Base
  attr_accessible :duration, :latitude, :longitude, :scor_team1, :scor_team2, :state
 
  #model connection with models
  has_and_belongs_to_many :teams, through: :teamgame, foreign_key: "game_id"

  has_many :tournaments, through: :tournament_games

  has_one :tournament_game, foreign_key: 'game_id'

  #validate data
  validates :latitude , :presence =>true
  validates :longitude , :presence =>true
  validates :scor_team1 , :presence =>true,
						 numericality: { only_integer: true }
  validates :scor_team2 , :presence =>true
						  :numericality => { :only_integer => true }
  validates :team1_id , :presence =>true
  validates :team2_id , :presence =>true
  validates :state, :inclusion => { :in => %w(on off)}
  validates :sport_id, :presence => true
end
