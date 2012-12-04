class User < ActiveRecord::Base
  attr_accessible :city, :initial, :name, :email, :fb_id, :id
  
  #models connection
  has_many :teams, through: :team_players
  has_many :played_games, class_name: "Game", through: :team_games, foreign_key: 'user_id'
  belongs_to :team, foreign_key: 'captain_id'
  
  before_save {|user| user.email = email.downcase}

  #model validations
  #EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true,
				    length: { :maximum => 50,
					         	  :minimum => 3}

  validates :city, length: { maximum: 30}

  validates :fb_id, uniqueness: true,
	  				presence: true

def show_played_sports
  User.joins('JOIN user_games ON user_games.user_id = users.id').joins('JOIN games ON games.id = user_games.game_id').joins('JOIN sports ON sports.id=games.sport_id').where('users.id=?',self.id).select('distinct sports.name')
end

def all_teams
  Team.joins('JOIN team_players ON teams.id = team_players.team_id').where('team_players.user_id = ?', self.id)
end

def games_played
  @teams = self.all_teams
  return @teams
end
  
end


