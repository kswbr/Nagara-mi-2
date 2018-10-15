FactoryBot.define do
  factory :site_type do
    sequence(:name) { |n| "TEST_SITE_TYPE#{n}"}
  end
end
