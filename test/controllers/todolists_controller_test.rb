require 'test_helper'

class TodolistsControllerTest < ActionDispatch::IntegrationTest
  test "should get Home" do
    get todolists_Home_url
    assert_response :success
  end

end
