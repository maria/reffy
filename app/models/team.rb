class Team < ActiveRecord::Base
  attr_accessible :captain_id, :name
   
  has_many :users, through: :team_players
 
  has_many :games1, :class_name => "Game", foreign_key: 'team1_id'
  has_many :games2, :class_name => "Game", foreign_key: 'team2_id'
  
  def count_all_games
    Game.joins('JOIN teams ON (games.team1_id = teams.id OR games.team2_id = teams.id)').where("(team1_id = :id OR team2_id = :id) AND state = :stat",{id: self.id, stat:"off"}).count	
  end

  def show_all_games
    Game.joins('JOIN teams ON (games.team1_id = teams.id OR games.team2_id = teams.id)').where("(team1_id = :id OR team2_id = :id) AND state = :stat",{id: self.id, stat:"off"})
  end

  def count_team_score
    @team_score = 0

    self.games_of_team.find_each do |game|
    
       if game.team1_id = @team.id
         @team_score += game.scor_team1
       else
         @team_score += game.scor_team2
  
          end
        end
    return @team_score
  end
end
