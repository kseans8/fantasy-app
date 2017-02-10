desc "creates a league"
task league_management: :environment do
  leagues = League.all

  leagues.each do |league|
    league.determine_rankings
  end

  DatabaseCleaner.clean_with(:truncation, :only => ['leagues'])
  League.create!(name: "Experts")
  League.create!(name: "Enthusiasts")
  League.create!(name: "Beginners")
end
