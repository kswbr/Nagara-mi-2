FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "TEST_MOVIE_TITLE#{n}"}
    sequence(:url) { |n| "TEST_MOVIE_URL#{n}.com"}
    publish {true}
    feed
    # movie_type
  end
  factory :movie_unpublish, class: Movie do
    sequence(:title) { |n| "TEST_MOVIE_TITLE#{n}"}
    sequence(:url) { |n| "TEST_MOVIE_URL#{n}.com"}
    publish {false}
    feed
    # movie_type
  end

end
