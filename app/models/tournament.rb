class Tournament < ActiveRecord::Base
  attr_accessible :data, :name, :sport_id
  
  has_many :games, through: :tournamentgames
 
  validates :name , presence: true,
					length: { maximum: 30}

  validates  :sport_id , presence: true
					
end
