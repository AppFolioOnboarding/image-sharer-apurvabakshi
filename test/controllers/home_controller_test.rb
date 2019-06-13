require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert response.body.include? 'Welcome'
  end
end
