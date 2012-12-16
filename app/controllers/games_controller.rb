class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    @game.team1_id = Team.find(@game.team1_id).select(:name)
    @game.team2_id = Team.find(@game.team2_id).select(:name)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
def create
    
  @team_1 = Team.find_by_name(params[:game][:team1_id])
  @team_2 = Team.find_by_name(params[:game][:team2_id])

  @user = User.find_by_fb_id(params[:game][:user_id])

  respond_to do |format|

    if @team_1.nil?
          @team_1 = Team.new(name: params[:game][:team1_id], captain_id: @user.id)
          @team_1.save
    end  

    if @team_2.nil?
          @team_2 = Team.new(name: params[:game][:team2_id], captain_id: @user.id)     
          @team_2.save     
    end

    params[:game][:team1_id] = @team_1.id
    params[:game][:team2_id] = @team_2.id

    params[:game].delete :user_id

    @game = Game.new(params[:game])
      
        if @game.save
                format.json { render json: @game, status: :created}
        else      
                format.json { render json: @game.errors }
        end 
  end
end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params["id"])
  
    if @game.state == 'on'
     respond_to do |format|
      if @game.update_attributes(params[:game])
        format.json { render json: @game }
      else
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
    else
    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.json { render json: @game }
      else     
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
     end
    end
   
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end


 def show_on_games
  @on_games = Hash.new { |h, k| h[k] = Hash.new }
  i = 1

 @all_on_games = Game.where("state = 'on'")
 print @all_on_games

  @all_on_games.all.each do |game|

    if game.team1_id != 0 && game.team2_id != 0

        dist = distance(params[:latitude], params[:longitude],
                        game.latitude, game.longitude,
                        params[:radius])
        if dist 
          @on_games['game_#{i}']['sport'] = game.sport_id
          @on_games['game_#{i}']['duration'] = game.duration

          user_id = User.find(game.user_id).fb_id
          @on_games['game_#{i}']['user'] = user_id

          @on_games['game_#{i}']['latitude'] = game.latitude
          @on_games['game_#{i}']['longitude'] = game.longitude


          @on_games['game_#{i}']['team1_id'] = game.team1_id
          @on_games['game_#{i}']['team2_id'] = game.team2_id

          @on_games['game_#{i}']['team1_name'] = Team.find(game.team1_id).name
          @on_games['game_#{i}']['team2_name'] = Team.find(game.team2_id).name

          i += 1
       end
      end
    
  end

  respond_to do |format|
    format.json {render json: @on_games}
    end
  end
  
 def teams_for_game
   @game = Game.find(params[:id])

   @teams = @game.show_teams
    respond_to do |format|
      format.json {render json: @teams}
  end
 end

 def game_players
end
   
 def join_game
    
    @user = User.find_by_fb_id(params[:user_id])
    @team = Team.find_by_id(params[:team_id])
    @game = Game.find_by_id(params[:id])

	respond_to do |format|
	
		#daca id-urile oferite nu sunt bune
		if @user.nil? || @team.nil? || @game.nil?  || (@game.team1_id != @team.id && @game.team2_id != @team.id)
			format.json {head :status => 406 }
		else
			@team_game = TeamGame.new(game_id: @game.id, user_id: @user.id, team_id: @team.id)
			
			@existent_team_game = TeamGame.find(:first, :conditions => ["user_id = ? and game_id = ?", @user.id, @game.id])
			
			#daca userul exista deja in joc nu poate fi adaugat iar
			if @existent_team_game.nil?
				@team_game.save
				
				@existing_player = TeamPlayer.find(:first, :conditions => ["user_id = ? and team_id = ?", @user.id, @team.id])
				
				#daca intrarea exista deja in team_player nu trebuie adaugata iar
				if @existing_player.nil?
					@player = TeamPlayer.new(user_id: @user.id, team_id: @team.id)
					@player.save
				end
				format.json { head :no_content }
			else
				format.json {head :status => 409 }
			end
			
		end
    end
    
 end

def distance(lat, long, glat, glong, radius)
    lat = lat.to_f
    long = long.to_f
    radius = radius.to_i

    dlat = (lat - glat).to_rad
    dlong = (long - glong).to_rad

     a = Math.sin(dlat/2) * Math.sin(dlat/2) +
         Math.cos(lat.to_rad) * Math.cos(glat.to_rad) *
         Math.sin(dlong/2) * Math.sin(dlong/2)

     c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
     d = 6371 * c; # Multiply by 6371 to get Kilometers

     if d < radius
      return true 
     else 
      return false 
  end
end
end

class Numeric
    def to_rad
      self * Math::PI / 180
    end
  end

