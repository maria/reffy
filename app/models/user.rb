class User < ActiveRecord::Base
  attr_accessible :city, :initial, :name, :fb_id, :team_id

  has_many :sports, foreign_key: 'sport_id'

  has_many :teams, foreign_key: 'user_id'
  belongs_to :team

end
