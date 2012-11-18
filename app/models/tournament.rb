class Tournament < ActiveRecord::Base
  attr_accessible :data, :name, :sport_id
  
  has_many :games, through: :tournamentgames, foreign_key: 'tournament_id'
 
  validates :name , presence: true,
					length: { maximum: 30}

  validates  :sport_id , presence: true
					
end
