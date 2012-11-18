class User < ActiveRecord::Base
  attr_accessible :city, :initial, :name, :email, :fb_id
  
  #models connection
  has_many :teamplayers
  has_many :teams, through: :teamplayers, foreign_key: 'user_id'

  
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
  Sports.join()
end

def teams
  Team.joins(:users)
end

def games_played
#   Game.joins('')
end
  
end


