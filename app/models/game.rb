class Game < ActiveRecord::Base
  attr_accessible :duration, :latitude, :longitude, :scor_team1, :scor_team2, :state, :team1_id, :team2_id, :sport_id, :user_id
  #model connection with models
  belongs_to :team
  has_one :tournament, through: :tournament_game

  has_many :players, class_name: "User", through: :team_games, foreign_key: 'game_id'

  #validate data
  validates :latitude , presence: true
  validates :longitude , presence: true

  validates :scor_team1 , :presence =>true,
						 numericality: { only_integer: true }

  validates :scor_team2 , presence: true,
					 	numericality: { only_integer: true }


  validates :state, inclusion: { in: %w(on off)}

  def all_games_for_teams
    Game.joins('JOIN team_games ON games.id = team_games.game_id').where('team1_id = ? or team2_id = ?', self.id)
  end
 def show_teams
    Team.select('teams.name').where('teams.id = :id1 OR teams.id = :id2', id1: self.team1_id,  id2: self.team2_id)
 end
 def get_team1_name
 	Team.joins('JOIN games ON games.team1_id = teams.id').where('games.id=?',self.id).select('teams.name')
 end
 def get_team2_name
 	Team.joins('JOIN games ON games.team2_id = teams.id').where('games.id=?',self.id).select('teams.name')
 end
end
