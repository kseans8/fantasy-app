class League < ApplicationRecord
  validates :name, presence: true

  has_many :teams
end
