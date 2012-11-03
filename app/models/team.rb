class Team < ActiveRecord::Base
  attr_accessible :captain_id, :name, :sport_id

  has_many :games1, :class_name => "Game",  foreign_key: 'team1_id'
  has_many :games2, :class_name => "Game", foreign_key: 'team2_id'

  belongs_to :sport
  belongs_to :user
  
end
