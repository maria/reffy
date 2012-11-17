class Team < ActiveRecord::Base
  attr_accessible :captain_id, :name, :sport_id, :user_id, :game_id

  has_and_belongs_to_many :users, foreign_key: 'team_id' 
  has_many :teamplayers, foreign_key: 'team_id'
 
  has_and_belongs_to_many :games1, :class_name => "Game",  foreign_key: 'team1_id'
  has_and_belongs_to_many :games2, :class_name => "Game",  foreign_key: 'team2_id'

  belongs_to :sport
  validates :name, :presence => true,
				    :lenght   => { :maximum => 30}
					:uniqueness => true
  validates :captain_id, :presence => true
  validates :sport_id, :presence => true
  
  def count_all_teams
    Game.where("(team1_id = :team_id OR team2_id = :team_id) AND state = :stat", { team_id: self.id , stat: "off"}).count	
  end
 
end
