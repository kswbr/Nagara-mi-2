require "application_system_test_case"

class FaviconsTest < ApplicationSystemTestCase
  setup do
    @favicon = favicons(:one)
  end

  test "visiting the index" do
    visit favicons_url
    assert_selector "h1", text: "Favicons"
  end

  test "creating a Favicon" do
    visit favicons_url
    click_on "New Favicon"

    fill_in "Image", with: @favicon.image
    fill_in "Image Type", with: @favicon.image_type
    fill_in "Site", with: @favicon.site_id
    click_on "Create Favicon"

    assert_text "Favicon was successfully created"
    click_on "Back"
  end

  test "updating a Favicon" do
    visit favicons_url
    click_on "Edit", match: :first

    fill_in "Image", with: @favicon.image
    fill_in "Image Type", with: @favicon.image_type
    fill_in "Site", with: @favicon.site_id
    click_on "Update Favicon"

    assert_text "Favicon was successfully updated"
    click_on "Back"
  end

  test "destroying a Favicon" do
    visit favicons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favicon was successfully destroyed"
  end
end
