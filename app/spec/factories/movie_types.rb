FactoryBot.define do
  factory :movie_type do
    sequence(:title) { |n| "TEST_MOVIE_TYPE#{n}"}
    sequence(:url) { |n| "TEST_MOVIE_TYPE_URL#{n}.com"}
  end
end
