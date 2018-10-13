require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  setup do
    @movie = movies(:one)
  end

  test "visiting the index" do
    visit movies_url
    assert_selector "h1", text: "Movies"
  end

  test "creating a Movie" do
    visit movies_url
    click_on "New Movie"

    fill_in "Feed", with: @movie.feed_id
    fill_in "Image", with: @movie.image
    fill_in "Movie", with: @movie.movie_id
    fill_in "Movie Type", with: @movie.movie_type_id
    fill_in "Play Time", with: @movie.play_time
    fill_in "Publish", with: @movie.publish
    fill_in "Site", with: @movie.site_id
    fill_in "Site Type", with: @movie.site_type_id
    fill_in "Title", with: @movie.title
    fill_in "Url", with: @movie.url
    click_on "Create Movie"

    assert_text "Movie was successfully created"
    click_on "Back"
  end

  test "updating a Movie" do
    visit movies_url
    click_on "Edit", match: :first

    fill_in "Feed", with: @movie.feed_id
    fill_in "Image", with: @movie.image
    fill_in "Movie", with: @movie.movie_id
    fill_in "Movie Type", with: @movie.movie_type_id
    fill_in "Play Time", with: @movie.play_time
    fill_in "Publish", with: @movie.publish
    fill_in "Site", with: @movie.site_id
    fill_in "Site Type", with: @movie.site_type_id
    fill_in "Title", with: @movie.title
    fill_in "Url", with: @movie.url
    click_on "Update Movie"

    assert_text "Movie was successfully updated"
    click_on "Back"
  end

  test "destroying a Movie" do
    visit movies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movie was successfully destroyed"
  end
end
