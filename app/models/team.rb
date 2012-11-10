class Team < ActiveRecord::Base
  attr_accessible :captain_id, :name, :sport_id, :user_id, :game_id

  has_and_belongs_to_many :users, foreign_key: 'team_id' 
  
 
  has_and_belongs_to_many :games1, :class_name => "Game",  foreign_key: 'team1_id'
  has_and_belongs_to_many :games2, :class_name => "Game",  foreign_key: 'team2_id'

  belongs_to :sport
  
end
