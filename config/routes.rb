TeamX::Application.routes.draw do
  
  match 'users/:id/show_all_games', to: 'users#show_all_games', via: :get, action: 'show_all_games'
  match 'users/:id/played_sports', to: 'users#played_sports', via: :get, action: 'played_sports'
  match 'users/:id/all_teams', to: 'users#all_teams', via: :get, action: 'all_teams'
  
  match 'teams/:id/show_all_games', to: 'teams#show_all_games', via: :get, action: 'show_all_games' 
  match 'teams/:id/count_all_games', to: 'teams#count_all_games', via: :get, action: 'count_all_games' 
  match 'teams/:id/team_score', to: 'teams#count_team_score', via: :get, action: 'count_team_score' 
  match 'teams/:id/team_rating', to: 'teams#team_rating', via: :get, action: 'team_rating' 
  match 'teams/:id/team_members', to: 'teams#get_team_members', via: :get, action: 'get_team_members'
 
  match 'statistics/every_game', to: 'statistics#every_team_games', via: :get, action: 'every_team_games' 
  match 'statistics/every_team_details', to: 'statistics#every_team_details', via: :get, action: 'every_team_details' 
  
  match 'games/show_on_games', to: 'games#show_on_games', via: :get, action: 'show_on_games' 
  match 'games/:id/teams_for_game', to: 'games#teams_for_game', via: :get, action: 'teams_for_game' 
  
  resources :games

  resources :sports

  resources :teams 

  resources :team_games

  resources :team_players

  resources :tournaments

  resources :tournament_games

  resources :users
  
  resources :user_games
  
end
