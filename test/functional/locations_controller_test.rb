require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  test "should get latitude:float" do
    get :latitude:float
    assert_response :success
  end

  test "should get longtitute:float" do
    get :longtitute:float
    assert_response :success
  end

end
