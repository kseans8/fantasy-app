class Player < ApplicationRecord
  belongs_to :team_players
  has_many :teams, through: :team_players
end
