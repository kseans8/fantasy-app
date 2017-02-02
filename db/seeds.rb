League.create!(name: 'league1')
League.create!(name: 'league2')
League.create!(name: 'league3')

Player.create!(goals: 2, assists: 0)
Player.create!(goals: 1, assists: 0)
Player.create!(goals: 0, assists: 0)

Team.create!(name: 'team1', rank: 1, score: 2, user_id: 1, league_id: 1)
Team.create!(name: 'team2', rank: 2, score: 1, user_id: 1, league_id: 1)
Team.create!(name: 'team3', rank: 3, score: 0, user_id: 1, league_id: 1)

Team.create!(name: 'team4', rank: 1, score: 2, user_id: 1, league_id: 2)
Team.create!(name: 'team5', rank: 2, score: 1, user_id: 1, league_id: 2)
Team.create!(name: 'team6', rank: 3, score: 0, user_id: 1, league_id: 2)

Team.create!(name: 'team7', rank: 1, score: 2, user_id: 1, league_id: 3)
Team.create!(name: 'team8', rank: 2, score: 1, user_id: 1, league_id: 3)
Team.create!(name: 'team9', rank: 3, score: 0, user_id: 1, league_id: 3)

TeamPlayer.create!(team_id: 1, player_id: 1)
TeamPlayer.create!(team_id: 2, player_id: 2)
TeamPlayer.create!(team_id: 3, player_id: 3)
TeamPlayer.create!(team_id: 4, player_id: 1)
TeamPlayer.create!(team_id: 5, player_id: 2)
TeamPlayer.create!(team_id: 6, player_id: 3)
TeamPlayer.create!(team_id: 7, player_id: 1)
TeamPlayer.create!(team_id: 8, player_id: 2)
TeamPlayer.create!(team_id: 9, player_id: 3)
