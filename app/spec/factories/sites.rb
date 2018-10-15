FactoryBot.define do
  factory :site do
    sequence(:name) { |n| "TEST_SITE#{n}"}
    sequence(:url) { |n| "TEST_URL#{n}.com"}
    site_type
  end
end
