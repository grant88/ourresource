require 'test_helper'

class SelectionProcedureControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get select_procedure" do
    get :select_procedure
    assert_response :success
  end

end
