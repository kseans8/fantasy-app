RSpec.describe Team, type: :model do
  it { should validate_presence_of(:name) }
  it { should belong_to(:user) }
  it { should belong_to(:league) }
  it { should have_many(:team_players) }
  it { should have_many(:players).through(:team_players) }
end
