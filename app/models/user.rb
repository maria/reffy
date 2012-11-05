class User < ActiveRecord::Base
  attr_accessible :city, :initial, :name, :fb_id

  has_many :sports, foreign_key: 'sport_id'
  has_many :teams, foreign_key: 'captain_id'

end
