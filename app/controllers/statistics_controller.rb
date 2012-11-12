class StatisticsController < ApplicationController

 def every_team_games
    
    @every_game = Team.joins('LEFT OUTER JOIN games on (games.team1_id = teams.id OR games.team2_id = teams.id)')
   
    respond_to do |format|
      format.json {render json: @every_game}
    end
 end
 
 def every_team_details
   
   @every_game = Team.joins('LEFT OUTER JOIN games on (games.team1_id = teams.id OR games.team2_id = teams.id)')
   @team_players = Team.joins('LEFT OUTER JOIN teamplayers on teamplayers.team_id = teams.id')
   @the_hole = @every_game.group_by() 

    respond_to do |format|
      format.json {render json: @the_hole}
    end
 end

end
