class League < ApplicationRecord
  validates :name, presence: true

  has_many :teams

  def determine_rankings
    rankings = []
    self.teams.each do |team|
      team.determine_score
    end

    rankings = self.teams.sort_by { |team| team[:score]}.reverse!

    ii = 1
    rankings.each do |team|
      team.rank = ii
      ii += 1
    end
  end
end
