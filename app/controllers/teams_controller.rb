class TeamsController < ApplicationController
  def index
    @teams = Team.all.order("created_at DESC")
  end

  def show
    @team = Team.find(params[:id])
    @players = Player.all
  end
end
