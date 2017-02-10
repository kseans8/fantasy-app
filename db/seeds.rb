# League.create!(name: 'league1')
# League.create!(name: 'league2')
# League.create!(name: 'league3')
#
# Player.create!(goals: 2, assists: 0)
# Player.create!(goals: 1, assists: 0)
# Player.create!(goals: 0, assists: 0)
#
# Team.create!(name: 'team1', rank: 1, score: 2, user_id: 2, league_id: 1)
# Team.create!(name: 'team2', rank: 2, score: 1, user_id: 1, league_id: 1)
# Team.create!(name: 'team3', rank: 3, score: 0, user_id: 1, league_id: 1)
#
# Team.create!(name: 'team4', rank: 1, score: 2, user_id: 1, league_id: 2)
# Team.create!(name: 'team5', rank: 2, score: 1, user_id: 1, league_id: 2)
# Team.create!(name: 'team6', rank: 3, score: 0, user_id: 1, league_id: 2)
#
# Team.create!(name: 'team7', rank: 1, score: 2, user_id: 1, league_id: 3)
# Team.create!(name: 'team8', rank: 2, score: 1, user_id: 1, league_id: 3)
# Team.create!(name: 'team9', rank: 3, score: 0, user_id: 1, league_id: 3)
#
# TeamPlayer.create!(team_id: 1, player_id: 1)
# TeamPlayer.create!(team_id: 2, player_id: 2)
# TeamPlayer.create!(team_id: 3, player_id: 3)
# TeamPlayer.create!(team_id: 4, player_id: 1)
# TeamPlayer.create!(team_id: 5, player_id: 2)
# TeamPlayer.create!(team_id: 6, player_id: 3)
# TeamPlayer.create!(team_id: 7, player_id: 1)
# TeamPlayer.create!(team_id: 8, player_id: 2)
# TeamPlayer.create!(team_id: 9, player_id: 3)
#
# require 'httparty'
# require 'pry'
#
# auth = {:username => "kseans8", :password => "kseans8"}
#
# date = DateTime.now
# month = format('%02d', date.month)
# day = format('%02d', date.day)
# year = format('%02d', date.year - 2)
# year2 = format('%02d', date.year - 1)
# response = HTTParty.get("https://www.mysportsfeeds.com/api/feed/pull/nhl/#{year}-#{year2}/daily_player_stats.json?fordate=#{year2}#{month}#{day}", :basic_auth => auth)
#
# response["dailyplayerstats"]["playerstatsentry"].each do |player|
#   name = player["player"]["FirstName"] + " " + player["player"]["LastName"]
#
#   position = player["player"]["Position"]
#
#   goals = player["stats"]["Goals"]["#text"].to_i
#
#   assists =  player["stats"]["Assists"]["#text"].to_i
#
#   Player.create(name: name, position: position, goals: goals, assists: assists)
# end
