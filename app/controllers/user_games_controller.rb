class UserGamesController < ApplicationController
  # GET /user_games
  # GET /user_games.json
  def index
    @user_games = UserGame.all

    respond_to do |format|
      format.json { render json: @user_games }
    end
  end

  # GET /user_games/1
  # GET /user_games/1.json
  def show
    id = User.find_by_fb_id(params[:id]).id
    @user_game = UserGame.find_by_user_id(id)

    respond_to do |format|
      format.json { render json: @user_game }
    end
  end

  # GET /user_games/new
  # GET /user_games/new.json
  def new
    @user_game = UserGame.new

    respond_to do |format|
      format.json { render json: @user_game }
    end
  end

  # GET /user_games/1/edit
  def edit
    id = User.find_by_fb_id(params[:id]).id
    @user_game = UserGame.find_by_user_id(id)
  end

  # POST /user_games
  # POST /user_games.json
  def create
    params[:user_game][:id] = User.find_by_fb_id(params[:id]).id
    @user_game = UserGame.new(params[:user_game])

    respond_to do |format|
      if @user_game.save
        format.json { render json: @user_game, status: :created, location: @user_game }
      else
        format.json { render json: @user_game.errors }
      end
    end
  end

  # PUT /user_games/1
  # PUT /user_games/1.json
  def update
    id = User.find_by_fb_id(params[:id]).id
    @user_game = UserGame.find_by_user_id(id)

    respond_to do |format|
      if @user_game.update_attributes(params[:user_game])
        format.json { head :no_content }
      else
        format.json { render json: @user_game.errors }
      end
    end
  end

  # DELETE /user_games/1
  # DELETE /user_games/1.json
  def destroy
    id = User.find_by_fb_id(params[:id]).id
    @user_game = UserGame.find_by_user_id(id)
    @user_game.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
