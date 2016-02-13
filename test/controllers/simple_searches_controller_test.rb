require 'test_helper'

class SimpleSearchesControllerTest < ActionController::TestCase
  setup do
    @simple_search = simple_searches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simple_searches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simple_search" do
    assert_difference('SimpleSearch.count') do
      post :create, simple_search: { keywords: @simple_search.keywords, location: @simple_search.location }
    end

    assert_redirected_to simple_search_path(assigns(:simple_search))
  end

  test "should show simple_search" do
    get :show, id: @simple_search
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @simple_search
    assert_response :success
  end

  test "should update simple_search" do
    patch :update, id: @simple_search, simple_search: { keywords: @simple_search.keywords, location: @simple_search.location }
    assert_redirected_to simple_search_path(assigns(:simple_search))
  end

  test "should destroy simple_search" do
    assert_difference('SimpleSearch.count', -1) do
      delete :destroy, id: @simple_search
    end

    assert_redirected_to simple_searches_path
  end
end
