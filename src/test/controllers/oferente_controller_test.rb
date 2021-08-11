require "test_helper"

class OferenteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get oferente_index_url
    assert_response :success
  end

  test "should get create" do
    get oferente_create_url
    assert_response :success
  end

  test "should get new" do
    get oferente_new_url
    assert_response :success
  end

  test "should get update" do
    get oferente_update_url
    assert_response :success
  end

  test "should get destroy" do
    get oferente_destroy_url
    assert_response :success
  end
end
