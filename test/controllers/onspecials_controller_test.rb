require 'test_helper'

class OnspecialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onspecial = onspecials(:one)
  end

  test "should get index" do
    get onspecials_url
    assert_response :success
  end

  test "should get new" do
    get new_onspecial_url
    assert_response :success
  end

  test "should create onspecial" do
    assert_difference('Onspecial.count') do
      post onspecials_url, params: { onspecial: { customer: @onspecial.customer, end: @onspecial.end, part: @onspecial.part, start: @onspecial.start } }
    end

    assert_redirected_to onspecial_url(Onspecial.last)
  end

  test "should show onspecial" do
    get onspecial_url(@onspecial)
    assert_response :success
  end

  test "should get edit" do
    get edit_onspecial_url(@onspecial)
    assert_response :success
  end

  test "should update onspecial" do
    patch onspecial_url(@onspecial), params: { onspecial: { customer: @onspecial.customer, end: @onspecial.end, part: @onspecial.part, start: @onspecial.start } }
    assert_redirected_to onspecial_url(@onspecial)
  end

  test "should destroy onspecial" do
    assert_difference('Onspecial.count', -1) do
      delete onspecial_url(@onspecial)
    end

    assert_redirected_to onspecials_url
  end
end
