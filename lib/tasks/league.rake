desc "creates a league"
task league_management: :environment do
  League.delete_all
  League.create!(name: "Experts")
  League.create!(name: "Enthusiasts")
  League.create!(name: "Beginners")
end
