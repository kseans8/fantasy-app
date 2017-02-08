desc "creates a league"
task league_management: :environment do
  DatabaseCleaner.clean_with(:truncation, :only => ['leagues'])
  League.create!(name: "Experts")
  League.create!(name: "Enthusiasts")
  League.create!(name: "Beginners")
end
