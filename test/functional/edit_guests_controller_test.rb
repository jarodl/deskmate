require File.dirname(__FILE__) + '/../test_helper'
require 'edit_guests_controller'

# Re-raise errors caught by the controller.
class EditGuestsController; def rescue_action(e) raise e end; end

class EditGuestsControllerTest < Test::Unit::TestCase
  fixtures :guests

  def setup
    @controller = EditGuestsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = guests(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:guests)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:guest)
    assert assigns(:guest).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:guest)
  end

  def test_create
    num_guests = Guest.count

    post :create, :guest => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_guests + 1, Guest.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:guest)
    assert assigns(:guest).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Guest.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Guest.find(@first_id)
    }
  end
end
