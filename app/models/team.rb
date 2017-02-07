class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :teams_can_only_have_10_players,

  belongs_to :user
  belongs_to :league
  has_many :team_players
  has_many :players, through: :team_players

  def teams_can_only_have_10_players
    if Team.players.count > 10
      errors.add(:players, "Team limit is 10 players")
    end
  end
end
