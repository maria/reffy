class UsersController < ApplicationController
  Koala.http_service.http_options = {:ssl => {:ca_path => "/etc/ssl/certs"}}
  
  #GET /users
  #GET /users.json
    def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
     end
    end
end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end


#=============================================
#              Facebook API
#=============================================

  def create_facebook_user
    @access_token = params[:fb_access_token]

      @graph = Koala::Facebook::API.new(@access_token)
      user_fb = @graph.get_object("me")

      @user = User.find_by_fb_id(user_fb["id"])

      if @user.blank?
       rand_password = SecureRandom.hex(8)
       @user = User.new(:name => user_fb["name"], :fb_id => user_fb["id"],
                        :password => rand_password, :password_confirmation => rand_password)

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end

      else
        format.json { render json: @user, status: :existing, location: @user }
      end
  end

