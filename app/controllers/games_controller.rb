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
    
  @team_1 = Team.find_by_name(params["team1_name"])
  @team_2 = Team.find_by_name(params["team2_name"])

  @game = Game.new(params[:game], team1_id: @team_1.id, team2_id: @team_2.id)
    
  respond_to do |format|
    if @team_1 && @team_2
          if @game.save
         
            format.json { render json: @game, status: :created, location: @game }
          else
           
            format.json { render json: @game.errors, status: :unprocessable_entity }
          end 
    elsif @team_1.nil?
            format.json { render json: @game.team1_name, status: :unprocessable_entity }
    else
           format.json { render json: @game.team2_name, status: :unprocessable_entity }
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
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end


 def show_on_games
  @all_on_games = Game.where('state = ?', "on")

  respond_to do |format|
    format.json {render json: @all_on_games}
  end
 end

end
