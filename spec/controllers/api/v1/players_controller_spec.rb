require "rails_helper"

RSpec.describe Api::V1::PlayersController, type: :controller do
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

    it "should show all of the players and their data" do
      sign_in sean
      get :index, params: { id: sean.id }
      json = JSON.parse(response.body)

      expect(json["players"].length).to eq(4)
      expect(json["players"][0]["name"]).to eq("player1")
      expect(json["players"][0]["position"]).to eq("C")
      expect(json["players"][0]["goals"]).to eq(1)
      expect(json["players"][0]["assists"]).to eq(0)

      expect(json["players"][1]["name"]).to eq("player2")
      expect(json["players"][1]["position"]).not_to eq("D")
      expect(json["players"][1]["goals"]).not_to eq(10)
      expect(json["players"][1]["assists"]).not_to eq(10)

      expect(json["players"][2]["name"]).to eq("player3")
      expect(json["players"][2]["position"]).to eq("LW")
      expect(json["players"][2]["goals"]).to eq(1)
      expect(json["players"][2]["assists"]).to eq(1)

      expect(json["players"][3]["name"]).to eq("player4")
      expect(json["players"][3]["position"]).to eq("D")
      expect(json["players"][3]["goals"]).not_to eq(1)
      expect(json["players"][3]["assists"]).not_to eq(1)
    end
  end
end
