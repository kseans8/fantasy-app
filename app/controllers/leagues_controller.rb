class LeaguesController < ApplicationController
  def index
    @leagues = League.all.order("created_at DESC")
  end

  def show
    @leagues = League.all
    @league = League.find(params[:id])
    @teams = @league.teams
  end
end
