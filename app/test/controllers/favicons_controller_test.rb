require 'test_helper'

class FaviconsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favicon = favicons(:one)
  end

  test "should get index" do
    get favicons_url
    assert_response :success
  end

  test "should get new" do
    get new_favicon_url
    assert_response :success
  end

  test "should create favicon" do
    assert_difference('Favicon.count') do
      post favicons_url, params: { favicon: { image: @favicon.image, image_type: @favicon.image_type, site_id: @favicon.site_id } }
    end

    assert_redirected_to favicon_url(Favicon.last)
  end

  test "should show favicon" do
    get favicon_url(@favicon)
    assert_response :success
  end

  test "should get edit" do
    get edit_favicon_url(@favicon)
    assert_response :success
  end

  test "should update favicon" do
    patch favicon_url(@favicon), params: { favicon: { image: @favicon.image, image_type: @favicon.image_type, site_id: @favicon.site_id } }
    assert_redirected_to favicon_url(@favicon)
  end

  test "should destroy favicon" do
    assert_difference('Favicon.count', -1) do
      delete favicon_url(@favicon)
    end

    assert_redirected_to favicons_url
  end
end
