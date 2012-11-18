# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.create(name:'Jhon Doe 1',city:'Bucuresti',fb_id:'jhon-doe1', email:'jhon-doe1@email.com')
User.create(name:'Jhon Doe 2',city:'Bucuresti',fb_id:'jhon-doe2', email:'jhon-doe2@email.com')
User.create(name:'Jhon Doe 3',city:'Iasi',fb_id:'jhon-doe3', email:'jhon-doe3@email.com')
User.create(name:'Jhon Doe 4',city:'Ploiesti',fb_id:'jhon-doe4', email:'jhon-doe4@email.com')
User.create(name:'Jhon Doe 5',city:'Pitesti',fb_id:'jhon-doe5', email:'jhon-doe5@email.com')
User.create(name:'Jhon Doe 6',city:'Ploiesti',fb_id:'jhon-doe6', email:'jhon-doe6@email.com')
User.create(name:'Jhon Doe 7',city:'Constanta',fb_id:'jhon-doe7', email:'jhon-doe7@email.com')
User.create(name:'Jhon Doe 8',city:'Timisoara',fb_id:'jhon-doe8', email:'jhon-doe8@email.com')
User.create(name:'Jhon Doe 9',city:'Galati',fb_id:'jhon-doe9', email:'jhon-doe9@email.com')
User.create(name:'Jhon Doe 10',city:'Braila',fb_id:'jhon-doe10', email:'jhon-doe10@email.com')
User.create(name:'Jhon Doe 11',city:'Brasov',fb_id:'jhon-doe29', email:'jhon-doe11@email.com')
User.create(name:'Jhon Doe 12',city:'Sibiu',fb_id:'jhon-doe30', email:'jhon-doe12@email.com')
User.create(name:'Jhon Doe 13',city:'Baia-Mare',fb_id:'jhon-doe31', email:'jhon-doe13@email.com')

Sport.create(name: 'Sport 1')
Sport.create(name: 'Sport 2')
Sport.create(name: 'Sport 2')
Sport.create(name: 'Sport 4')
Sport.create(name: 'Sport 5')
Sport.create(name: 'Sport 6')
Sport.create(name: 'Sport 7')

Tournament.create(name:'Football Masters',data: DateTime.new(2012,11,20),sport_id:1)


Team.create(name:'Team1',captain_id:1)
Team.create(name:'Team2',captain_id:2)
Team.create(name:'Team3',captain_id:3)
Team.create(name:'Team4',captain_id:4)
Team.create(name:'Team5',captain_id:5)
Team.create(name:'Team6',captain_id:6)
Team.create(name:'Team7',captain_id:7)
Team.create(name:'Team8',captain_id:8)
Team.create(name:'Team9',captain_id:9)
Team.create(name:'Team10',captain_id:10)
Team.create(name:'Team11',captain_id:11)
Team.create(name:'Team12',captain_id:12)
Team.create(name:'Team13',captain_id:9)


Game.create(latitude:"44.437711",longitude:"26.097367",scor_team1:1,scor_team2:0,duration:45,state:"on")
Game.create(latitude:"44.431711",longitude:"26.087367",scor_team1:3,scor_team2:2,duration:90,state:"on")
Game.create(latitude:"44.435311",longitude:"26.097367",scor_team1:2,scor_team2:2,duration:92,state:"off")
Game.create(latitude:"44.432001",longitude:"26.086367",scor_team1:1,scor_team2:2,duration:76,state:"on")
Game.create(latitude:"44.432311",longitude:"26.084367",scor_team1:0,scor_team2:3,duration:91,state:"off")
Game.create(latitude:"44.435011",longitude:"26.107367",scor_team1:8,scor_team2:10,duration:20,state:"on")
Game.create(latitude:"44.433511",longitude:"26.086267",scor_team1:12,scor_team2:18,duration:55,state:"off")
Game.create(latitude:"44.435511",longitude:"26.102328",scor_team1:35,scor_team2:45,duration:45,state:"on")
Game.create(latitude:"44.434511",longitude:"26.102228",scor_team1:20,scor_team2:23,duration:30,state:"on")
Game.create(latitude:"44.435211",longitude:"26.102528",scor_team1:2,scor_team2:2,duration:78,state:"on")

TeamGame.create(team1_id:1,team2_id:2,sport_id:1,game_id:1)
TeamGame.create(team1_id:1,team2_id:3,sport_id:1,game_id:2)
TeamGame.create(team1_id:1,team2_id:4,sport_id:1,game_id:3)
TeamGame.create(team1_id:2,team2_id:4,sport_id:2,game_id:2)


TeamPlayer.create(team_id:1,user_id:1)
TeamPlayer.create(team_id:1,user_id:2)
TeamPlayer.create(team_id:1,user_id:3)
TeamPlayer.create(team_id:1,user_id:4)
TeamPlayer.create(team_id:2,user_id:5)
TeamPlayer.create(team_id:2,user_id:2)
TeamPlayer.create(team_id:2,user_id:6)
TeamPlayer.create(team_id:2,user_id:7)
TeamPlayer.create(team_id:3,user_id:8)
TeamPlayer.create(team_id:3,user_id:9)
TeamPlayer.create(team_id:3,user_id:3)
TeamPlayer.create(team_id:3,user_id:10)
TeamPlayer.create(team_id:4,user_id:11)
TeamPlayer.create(team_id:4,user_id:2)
TeamPlayer.create(team_id:4,user_id:3)
TeamPlayer.create(team_id:4,user_id:4)
TeamPlayer.create(team_id:5,user_id:4)
TeamPlayer.create(team_id:5,user_id:5)
TeamPlayer.create(team_id:5,user_id:2)
TeamPlayer.create(team_id:6,user_id:6)
TeamPlayer.create(team_id:7,user_id:7)
TeamPlayer.create(team_id:8,user_id:8)
TeamPlayer.create(team_id:9,user_id:9)
TeamPlayer.create(team_id:10,user_id:10)


TournamentGame.create(tournament_id:1,game_id:1)
TournamentGame.create(tournament_id:1,game_id:2)
TournamentGame.create(tournament_id:1,game_id:3)
TournamentGame.create(tournament_id:1,game_id:4)
