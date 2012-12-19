class UsersController < ApplicationController

#Specific methods

  #GET /users
  #GET /users.json
    def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by_fb_id(params["id"])

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find_by_fb_id(params["id"])

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.find_by_fb_id(params["id"])
    
      respond_to do |format|
       if @user.nil?
           @user = User.new(name: params["name"], initial: :name[0], 
                            city: params["city"], fb_id: params["id"],
                            email: params["email"])

        if @user.save
          format.json { render json: @user, status: :created, location: @user }
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
      end
      else
          format.json { render json: @user, status: :existing, location: @user }
     end
    end
end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find_by_fb_id(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.json { head :no_content }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find_by_fb_id(params[:id])
    @user.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

# Unspecific methods

 #Sports played by the user. We find them by
 #a join between games played and their 
 #sport id.
 def all_teams
   @user = User.find_by_fb_id(params["id"])
   @all = @user.all_teams()
    
     respond_to do |format|
      format.json {render json: @all}
    end
 end

 #users sports played along time
 def played_sports
  @user = User.find_by_fb_id(params["id"])
  
  @user_sports = @user.show_played_sports
  
    respond_to do |format|
      format.json { render json: @user_sports }
    end
  end

#All the games played by the user.
def show_all_games
     @user = User.find_by_fb_id(params["id"])
    
     @all_games = @user.games_played
    
    respond_to do |format|
      format.json {render json: @all_games}
    end
  end
  
def send_mails
	
	@mails = params["mails"]
	@mails.each do |mail|
		MyMailer.welcome_email(mail).deliver
	end
	
	respond_to do |format|
      format.json { head :no_content }
    end
	
end

end


