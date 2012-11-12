class ApplicationController < ActionController::Base
  protect_from_forgery
 
   def show_all_games
    @team = Team.find(params["id"])

    @all_games = Game.where("team1_id = :team_id OR team2_id = :team_id", {:team_id => params["id"]})

    respond_to do |format|
      format.html { redirect_to @team }
      format.json { render json: @all_games }
    end

  end

  def count_all_games
    @team = Team.find(params["id"])

    @count_games = @team.count_all_games()

    respond_to do |format|
      format.json { render json: @count_games }
    end
  end
 
  def count_team_score
     @team = Team.find(params["id"])
     @team_score = 0

     Game.where("team1_id = :team_id OR team2_id = :team_id", team_id: @team.id ).find_each do |game|
       if game.team1_id = @team.id
         @team_score += game.scor_team1
       else
         @team_score += game.scor_team2
  
      end
     end
   
    respond_to do |format|
      format.json { render json: @team_score }
    end
   return @team_score
  end
 
  def team_rating
   @team = Team.find(params["id"])
   
   @team_game_no = @team.count_all_games()
   @team_score   = @team.count_team_score()

   @team_rating  = @team_game_no / @team_score
 
    respond_to do |format|
      format.json {render json: @team_rating}
    end
  end
 
  def show_all_user_games
     @user = User.find(params["id"])
     @all_games = []
  
     @all_team_games = Team.select('game_id').where("user_id = ?", @user.id)
     
     @all_team_games.find_each do |game|
        @all_games += Game.where("id = ?", game)
    
     end
     
    respond_to do |format|
      format.json {render json: @all_games}
    end
  end


private

  def mobile_user_agent?
    uag         = request.env["HTTP_USER_AGENT"].downcase rescue ""
    is_mobile   = false

    if uag.index("android") || uag.index("htc") || uag.index("iphone")
      is_mobile = true
    end

    @mobile_user_agent ||= ( request.env["HTTP_USER_AGENT"] && is_mobile )
  end

end
