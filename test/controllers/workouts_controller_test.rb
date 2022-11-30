require "test_helper"

class WorkoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get workouts_new_url
    assert_response :success
  end

  test "should get create" do
    get workouts_create_url
    assert_response :success
  end

  test "should get show" do
    get workouts_show_url
    assert_response :success
  end

  test "should get eddit" do
    get workouts_eddit_url
    assert_response :success
  end

  test "should get update" do
    get workouts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get workouts_destroy_url
    assert_response :success
  end

  test "should get index" do
    get workouts_index_url
    assert_response :success
  end
end
