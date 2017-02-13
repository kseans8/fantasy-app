FactoryGirl.define do
  factory :team do
    sequence(:name) {|n| "team#{n}"}
    rank 1
    user_id 1
    sequence(:league_id) {|n| n}
  end
end
