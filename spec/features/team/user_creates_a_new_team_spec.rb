require "rails_helper"

feature "user creates a new team" do

  before(:each) do
    user = FactoryGirl.create(:user)
    league = FactoryGirl.create(:league)
    sign_in user
  end

  scenario "user can navigate to the leagues page" do
    visit '/leagues'
    expect(page).to have_content "league1"
  end

  scenario "joins a league" do
    visit "/leagues"
    expect(page).to have_content "league2"
    click_link "league2"
    click_link "Join this league!"
    fill_in "Name", with: "scenario 2 team name"
    click_button "Create Team"
    expect(page).to have_content "scenario 2 team name"
  end
end
