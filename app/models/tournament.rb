class Tournament < ActiveRecord::Base
  attr_accessible :data, :name, :sport_id
  
  has_many :games, through: :tournament_game
 
  validates :name , presence: true,
					length: { maximum: 30}

 					
end
