class StatisticsController < ApplicationController

 def every_team_games
    
    @every_game = Team.joins('LEFT OUTER JOIN games on (games.team1_id = teams.id OR games.team2_id = teams.id)')
   
    respond_to do |format|
      format.json {render json: @every_game}
    end
 end

end
