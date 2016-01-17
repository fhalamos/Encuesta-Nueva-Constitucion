require 'test_helper'

class QuadrantsControllerTest < ActionController::TestCase
  setup do
    @quadrant = quadrants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quadrants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quadrant" do
    assert_difference('Quadrant.count') do
      post :create, quadrant: { description: @quadrant.description, name: @quadrant.name, title: @quadrant.title }
    end

    assert_redirected_to quadrant_path(assigns(:quadrant))
  end

  test "should show quadrant" do
    get :show, id: @quadrant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quadrant
    assert_response :success
  end

  test "should update quadrant" do
    patch :update, id: @quadrant, quadrant: { description: @quadrant.description, name: @quadrant.name, title: @quadrant.title }
    assert_redirected_to quadrant_path(assigns(:quadrant))
  end

  test "should destroy quadrant" do
    assert_difference('Quadrant.count', -1) do
      delete :destroy, id: @quadrant
    end

    assert_redirected_to quadrants_path
  end
end
