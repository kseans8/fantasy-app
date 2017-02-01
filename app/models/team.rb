class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :league
  belongs_to :team_players
  has_many :players, through: :team_players
end
