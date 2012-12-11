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

 @all_on_games = distance(params[:latitude], params[:longitude], params[:radius])

  @all_on_games.all.each do |game|

    if game.team1_id != 0 && game.team2_id != 0
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
      end
    i += 1
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
    @team_game = TeamGame.new(params[:game])
    @team_game.save

    @player = TeamPlayers.new(user_id: params[:game][:user_id],
			      team_id: params[:game][:team_id])
    @player.save
    
 end


 private

def distance (lat, long, radius)
    r = radius / 6371
    lat_min = (lat - r).to_rad
    lat_max = (lat + r).to_rad
    long_min = (long - r).to_rad
    long_max = (long + r).to_rad

     a = Math.sin(dLat/2) * Math.sin(dLat/2) +
         Math.cos(lat1.to_rad) * Math.cos(lat2.to_rad) *
         Math.sin(dLon/2) * Math.sin(dLon/2)

     d = 6371 * a; # Multiply by 6371 to get Kilometers

     return 
  end
end

class Numeric
    def to_rad
      self * Math::PI / 180
    end
  end

