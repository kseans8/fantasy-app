class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :league
  has_many :players, through :team_players
end
