class Sport < ActiveRecord::Base
  attr_accessible :name, :type

  has_many :teams, foreign_key: 'sport_id'
  has_many :tournaments, foreign_key: 'sport_id'
 
  has_and_belongs_to_many :users, foreign_key: 'sport_id'
   validates :name , presence: true,
					 length: {maximum: 30}
   validates  :type , presence: true,
					  length: {maximum: 30}
end
