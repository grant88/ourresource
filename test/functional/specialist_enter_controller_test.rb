require 'test_helper'

class SpecialistEnterControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get check" do
    get :check
    assert_response :success
  end

end
