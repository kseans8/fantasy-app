class PlayersController < ApplicationController
  def index
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def show
    @player = Player.find(params[:id])
  end
end
