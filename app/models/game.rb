class Game < ActiveRecord::Base
  attr_accessible :duration, :latitude, :longitude, :scor_team1, :scor_team2, :state
 
  #model connection with models
  has_many :teams, through: :team_games
  has_one :tournament, through: :tournament_game

  #validate data
  validates :latitude , presence: true
  validates :longitude , presence: true

  validates :scor_team1 , :presence =>true,
						 numericality: { only_integer: true }

  validates :scor_team2 , presence: true,
					 	numericality: { only_integer: true }


  validates :state, inclusion: { in: %w(on off)}

  def all_games_for_user
    Game.joins('JOIN team_games ON games.id = team_games.game_id').where('')
  end

end
