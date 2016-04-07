require 'test_helper'

class ApidocsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, params: {}, format: :json
    assert_response :success
  end
end