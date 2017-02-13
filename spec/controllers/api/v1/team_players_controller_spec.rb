require "rails_helper"

RSpec.describe Api::V1::TeamPlayersController, type: :controller do
  describe "GET #index" do
    let!(:sean) {
      User.create( email: "sean@example.com",
      username: "sean",
      password: "123456")
    }

    let!(:player1) {
      Player.create(
        name: "player1",
        position: "C",
        goals: 1,
        assists: 0)
    }
    let!(:player2) {
      Player.create(
        name: "player2",
        position: "RW",
        goals: 0,
        assists: 0)
    }
    let!(:player3) {
      Player.create(
        name: "player3",
        position: "LW",
        goals: 1,
        assists: 1)
    }
    let!(:player4) {
      Player.create(
        name: "player4",
        position: "D",
        goals: 10,
        assists: 10)
    }

    let!(:league) {
      League.create(name: "test")
    }

    let!(:team1) {
      Team.create(
        league: league,
        user: sean,
        name: "team1",
        rank: 1
      )
    }

    let!(:team_player) {
      TeamPlayer.create(
      team_id: team1.id,
      player_id: player1.id)
    }

    it "should show all of the players and their data" do
      sign_in sean
      get :index, params: { id: sean.id }
      json = JSON.parse(response.body)

      expect(json["team_player"].length).to eq(1)
      expect(json["team_player"][0]["player_id"]).to eq(player1.id)
      expect(json["team_player"][0]["team_id"]).to eq(team1.id)
    end
  end
end
