require 'test_helper'

class DontcallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dontcall = dontcalls(:one)
  end

  test "should get index" do
    get dontcalls_url
    assert_response :success
  end

  test "should get new" do
    get new_dontcall_url
    assert_response :success
  end

  test "should create dontcall" do
    assert_difference('Dontcall.count') do
      post dontcalls_url, params: { dontcall: { customer: @dontcall.customer, end: @dontcall.end, part: @dontcall.part, shipto: @dontcall.shipto, start: @dontcall.start } }
    end

    assert_redirected_to dontcall_url(Dontcall.last)
  end

  test "should show dontcall" do
    get dontcall_url(@dontcall)
    assert_response :success
  end

  test "should get edit" do
    get edit_dontcall_url(@dontcall)
    assert_response :success
  end

  test "should update dontcall" do
    patch dontcall_url(@dontcall), params: { dontcall: { customer: @dontcall.customer, end: @dontcall.end, part: @dontcall.part, shipto: @dontcall.shipto, start: @dontcall.start } }
    assert_redirected_to dontcall_url(@dontcall)
  end

  test "should destroy dontcall" do
    assert_difference('Dontcall.count', -1) do
      delete dontcall_url(@dontcall)
    end

    assert_redirected_to dontcalls_url
  end
end
