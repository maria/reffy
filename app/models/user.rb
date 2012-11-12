class User < ActiveRecord::Base
  attr_accessible :city, :initial, :name, :fb_id, :team_id, :sport_id

  has_and_belongs_to_many :teams, foreign_key: 'user_id'
  has_and_belongs_to_many :sports, foreign_key: 'id'
  
  has_many :teamplayers, through: :teams

end
