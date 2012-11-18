class Tournament < ActiveRecord::Base
  attr_accessible :data, :name, :sport_id
  
  has_many :games, through: :tournament_games
 
  validates :name , presence: true,
					length: { maximum: 30}

 					
end
