require File.dirname(__FILE__) + '/../test_helper'
require 'line_item_controller'

# Re-raise errors caught by the controller.
class LineItemController; def rescue_action(e) raise e end; end

class LineItemControllerTest < Test::Unit::TestCase
  def setup
    @controller = LineItemController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
