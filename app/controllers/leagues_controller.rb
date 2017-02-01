class LeaguesController < ApplicationController
  def index
    @leagues = League.all.order("created_at DESC")
  end

  def show
    @league = League.find(params[:id])
    @teams = @league.teams
  end
end
