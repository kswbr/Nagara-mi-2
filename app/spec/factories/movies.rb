FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "TEST_MOVIE_TITLE#{n}"}
    sequence(:url) { |n| "TEST_MOVIE_URL#{n}.com"}
    feed
  end
end
