FactoryBot.define do
  factory :feed do
    sequence(:title) { |n| "TEST_TITLE#{n}"}
    sequence(:url) { |n| "TEST_URL#{n}.com"}
    site
  end
end
