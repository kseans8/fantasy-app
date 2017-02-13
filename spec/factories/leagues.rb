FactoryGirl.define do
  factory :league do
    sequence(:name) {|n| "league#{n}"}
    sequence(:id) {|n| n}
  end
end
