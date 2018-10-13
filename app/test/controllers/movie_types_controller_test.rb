require 'test_helper'

class MovieTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie_type = movie_types(:one)
  end

  test "should get index" do
    get movie_types_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_type_url
    assert_response :success
  end

  test "should create movie_type" do
    assert_difference('MovieType.count') do
      post movie_types_url, params: { movie_type: { title: @movie_type.title, url: @movie_type.url } }
    end

    assert_redirected_to movie_type_url(MovieType.last)
  end

  test "should show movie_type" do
    get movie_type_url(@movie_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_type_url(@movie_type)
    assert_response :success
  end

  test "should update movie_type" do
    patch movie_type_url(@movie_type), params: { movie_type: { title: @movie_type.title, url: @movie_type.url } }
    assert_redirected_to movie_type_url(@movie_type)
  end

  test "should destroy movie_type" do
    assert_difference('MovieType.count', -1) do
      delete movie_type_url(@movie_type)
    end

    assert_redirected_to movie_types_url
  end
end
