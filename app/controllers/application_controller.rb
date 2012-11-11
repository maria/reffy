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

    @count_games = Game.where("(team1_id = :team_id OR team2_id = :team_id) AND state = :stat", { team_id: params["id"] , stat: "off"}).count

    respond_to do |format|
      format.json { render json: @count_games }
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
