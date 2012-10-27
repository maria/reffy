class Team < ActiveRecord::Base
  attr_accessible :captain_id, :name, :sport_id

  has_many :games, foreign_keys: 'team1_id' 'teamd2_id'
  belongs_to :sport
  belongs_to :user
  
end
