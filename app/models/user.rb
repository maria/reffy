class User < ActiveRecord::Base
  attr_accessible :city, :initial, :name, :email, :fb_id, :id
  
  #models connection
  has_many :teams, through: :team_players
  belongs_to :team, foreign_key: 'captain_id'
  #
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
  #Sports.joins()
end

def all_teams
  Team.joins('JOIN team_players ON teams.id = team_players.team_id').where('team_players.user_id = ?', self.id)
end

def games_played
  @teams = self.all_teams
  return @teams.all_games_for_teams
end
  
end


