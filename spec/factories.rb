FactoryBot.define do
  factory :game do
    name "MyString"
  end
  factory :player do
    sequence 1
    current_player false
  end
  factory :game_action do
    type ""
  end
  factory :user do
    sequence :email do |n| 
      "foo#{n}@example.com"
    end
    password "secret"
  end
end
