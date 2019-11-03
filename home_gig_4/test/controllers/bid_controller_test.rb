require 'test_helper'

class BidControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bid_index_url
    assert_response :success
  end

  test "should get show" do
    get bid_show_url
    assert_response :success
  end

  test "should get edit" do
    get bid_edit_url
    assert_response :success
  end

  test "should get new" do
    get bid_new_url
    assert_response :success
  end

  test "should get create" do
    get bid_create_url
    assert_response :success
  end

  test "should get update" do
    get bid_update_url
    assert_response :success
  end

  test "should get destroy" do
    get bid_destroy_url
    assert_response :success
  end

end
