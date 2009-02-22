require File.dirname(__FILE__) + '/../test_helper'
require 'guest_controller'

# Re-raise errors caught by the controller.
class GuestController; def rescue_action(e) raise e end; end

class GuestControllerTest < Test::Unit::TestCase
  def setup
    @controller = GuestController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
