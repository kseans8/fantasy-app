desc "removes teams after all analysis has been performed"
task teams_cleanup: :environment do
  teams = Team.all
  teams.each do |team|
    team.determine_score
  end

  DatabaseCleaner.clean_with(:truncation, :only => ['teams'])
end
