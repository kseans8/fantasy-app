class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :league
  has_many :team_players
  has_many :players, through: :team_players

  def determine_score
    self.score = 0
    self.players.each do |player|
      self.score += (player.goals * 2) + (player.assists)
    end
  end
end
