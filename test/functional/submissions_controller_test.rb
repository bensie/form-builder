require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Submission.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Submission.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Submission.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to submission_url(assigns(:submission))
  end
  
  def test_edit
    get :edit, :id => Submission.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Submission.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Submission.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Submission.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Submission.first
    assert_redirected_to submission_url(assigns(:submission))
  end
  
  def test_destroy
    submission = Submission.first
    delete :destroy, :id => submission
    assert_redirected_to submissions_url
    assert !Submission.exists?(submission.id)
  end
end
