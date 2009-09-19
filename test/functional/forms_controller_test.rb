require 'test_helper'

class FormsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Form.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Form.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Form.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to form_url(assigns(:form))
  end
  
  def test_edit
    get :edit, :id => Form.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Form.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Form.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Form.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Form.first
    assert_redirected_to form_url(assigns(:form))
  end
  
  def test_destroy
    form = Form.first
    delete :destroy, :id => form
    assert_redirected_to forms_url
    assert !Form.exists?(form.id)
  end
end
