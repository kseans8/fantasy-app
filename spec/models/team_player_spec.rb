RSpec.describe TeamPlayer, type: :model do
  it { should belong_to(:player) }
  it { should belong_to(:team) }
end
