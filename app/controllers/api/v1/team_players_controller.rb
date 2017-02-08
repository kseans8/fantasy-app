class Api::V1::TeamPlayersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @teamplayer = TeamPlayer.all
    render json: { team_id: @teamplayer}
  end

  def create
    data = JSON.parse(request.body.read)
    @teamplayer = TeamPlayer.new(team_id: data["team_id"], player_id: data["player_id"])
    if @teamplayer.save
      flash[:notice] = "You've drafted!"
      redirect_to :back
    else
      flash[:notice] = @teamplayer.errors.full_messages.to_sentence
    end
  end
end
