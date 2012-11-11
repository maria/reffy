class Sport < ActiveRecord::Base
  attr_accessible :name, :type

  has_many :teams, foreign_key: 'sport_id'
  has_many :tournaments, foreign_key: 'sport_id'
 
  has_and_belongs_to_many :users, foreign_key: 'sport_id'
end
