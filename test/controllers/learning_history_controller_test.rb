require "test_helper"

class LearningHistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get learning_history_new_url
    assert_response :success
  end

  test "should get index" do
    get learning_history_index_url
    assert_response :success
  end

  test "should get create" do
    get learning_history_create_url
    assert_response :success
  end

  test "should get destroy" do
    get learning_history_destroy_url
    assert_response :success
  end

  test "should get show" do
    get learning_history_show_url
    assert_response :success
  end
end
