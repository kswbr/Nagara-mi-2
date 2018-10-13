require "application_system_test_case"

class MovieTypesTest < ApplicationSystemTestCase
  setup do
    @movie_type = movie_types(:one)
  end

  test "visiting the index" do
    visit movie_types_url
    assert_selector "h1", text: "Movie Types"
  end

  test "creating a Movie type" do
    visit movie_types_url
    click_on "New Movie Type"

    fill_in "Title", with: @movie_type.title
    fill_in "Url", with: @movie_type.url
    click_on "Create Movie type"

    assert_text "Movie type was successfully created"
    click_on "Back"
  end

  test "updating a Movie type" do
    visit movie_types_url
    click_on "Edit", match: :first

    fill_in "Title", with: @movie_type.title
    fill_in "Url", with: @movie_type.url
    click_on "Update Movie type"

    assert_text "Movie type was successfully updated"
    click_on "Back"
  end

  test "destroying a Movie type" do
    visit movie_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movie type was successfully destroyed"
  end
end
