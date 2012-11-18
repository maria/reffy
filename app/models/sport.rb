class Sport < ActiveRecord::Base
  attr_accessible :name, :type

  has_many :tournaments, foreign_key: 'sport_id'
  has_many :games, through: :teamgames, foreign_key: 'sport_id'

   validates :name , presence: true,
					 length: {maximum: 30}
   validates :type , presence: true,
					  length: {maximum: 30}
end
