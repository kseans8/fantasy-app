desc "creates a league"
task league_management: :environment do
  League.delete_all
  League.new(name: "Experts")
  League.new(name: "Enthusiasts")
  League.new(name: "Beginners")
end
