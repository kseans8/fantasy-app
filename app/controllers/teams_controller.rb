class TeamsController < ApplicationController
  def index
    @teams = Team.all.order("created_at DESC")
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def new
    @team = Team.new
    @league = League.find(params[:league_id])
  end

  def create
    @league = League.find(params[:league_id])
    @team = Team.new(team_params)
    @team.league = @league
    @team.user = current_user
    @team.rank = 3
    if @team.save
      flash[:notice] = "You joined the league"
      redirect_to @team
    else
      flash[:notice] = @team.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
