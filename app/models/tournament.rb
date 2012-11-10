class Tournament < ActiveRecord::Base
  attr_accessible :data, :name, :sport_id
  
  has_many :tournament_games, foreign_key: 'tournament_id'
  has_many :games, through: :tournament_games
  belongs_to :sport
end
