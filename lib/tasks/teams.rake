desc "removes teams after all analysis has been performed"
task teams_cleanup: :environment do
  DatabaseCleaner.clean_with(:truncation, :only => ['teams'])
end
