desc "adds players from external API to database that are playing today"
task players_update: :environment do
  DatabaseCleaner.clean_with(:truncation, :only => ['players'])

  require 'httparty'

  auth = {:username => "kseans8", :password => "kseans8"}

  date = DateTime.now
  month = format('%02d', date.month)
  day = format('%02d', date.day)
  year = format('%02d', date.year - 2)
  year2 = format('%02d', date.year - 1)
  response = HTTParty.get("https://www.mysportsfeeds.com/api/feed/pull/nhl/#{year}-#{year2}/daily_player_stats.json?fordate=#{year2}#{month}#{day}", :basic_auth => auth)

  response["dailyplayerstats"]["playerstatsentry"].each do |player|
    name = player["player"]["FirstName"] + " " + player["player"]["LastName"]

    position = player["player"]["Position"]

    goals = player["stats"]["Goals"]["#text"].to_i

    assists =  player["stats"]["Assists"]["#text"].to_i

    Player.create(name: name, position: position, goals: goals, assists: assists)
  end
end
