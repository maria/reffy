class PlanGameController < ApplicationController

def create
	params[:game] = params[:plan_game][:game]
	@game = Game.new(params[:game])
	@game.create

	params[:team] = params[:plan_game][:team1]
	@team1 = Team.new(params[:team])
	@team1.create

	params[:team] = params[:plan_game][:team2]
	@team1 = Team.new(params[:team])
	@team1.create

end

#to be modified
def destroy
	redirect_to 'games/destroy'
end

def edit
	redirect_to 'games/edit'
end

def update
	redirect_to 'games/update'
end


end
