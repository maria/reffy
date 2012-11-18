class User < ActiveRecord::Base
  attr_accessible :city, :initial, :name, :email, :fb_id
  
  #models connection
  has_many :teams, through: :team_players
  #
  before_save {|user| user.email = email.downcase}

  #model validations
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true,
				    length: { :maximum => 50,
					         	  :minimum => 3}

  validates :email, presence: true,
					 format: { with: EMAIL_REGEX},
					 uniqueness: { case_sensitive: false}

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
    .joins()
end
  
end


