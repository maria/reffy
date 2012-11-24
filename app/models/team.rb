class Team < ActiveRecord::Base
  attr_accessible :captain_id, :name
   
  has_many :users, through: :team_players
 
  has_many :games1, :class_name => "Game", foreign_key: 'team1_id'
  has_many :games2, :class_name => "Game", foreign_key: 'team2_id'
  
  def count_all_teams
    Game.where("(team1_id = :team_id OR team2_id = :team_id) AND state = :stat", { team_id: self.id , stat: "off"}).count	
  end

  def count_team_score
  end

  def games_of_team
     @games = Game.where('team_id = ?', self.id)
  end
    
end
