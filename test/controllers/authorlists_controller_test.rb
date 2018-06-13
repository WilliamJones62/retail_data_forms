require 'test_helper'

class AuthorlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @authorlist = authorlists(:one)
  end

  test "should get index" do
    get authorlists_url
    assert_response :success
  end

  test "should get new" do
    get new_authorlist_url
    assert_response :success
  end

  test "should create authorlist" do
    assert_difference('Authorlist.count') do
      post authorlists_url, params: { authorlist: { custcode: @authorlist.custcode, dept: @authorlist.dept, partcode: @authorlist.partcode, priority: @authorlist.priority, seq: @authorlist.seq, turns: @authorlist.turns } }
    end

    assert_redirected_to authorlist_url(Authorlist.last)
  end

  test "should show authorlist" do
    get authorlist_url(@authorlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_authorlist_url(@authorlist)
    assert_response :success
  end

  test "should update authorlist" do
    patch authorlist_url(@authorlist), params: { authorlist: { custcode: @authorlist.custcode, dept: @authorlist.dept, partcode: @authorlist.partcode, priority: @authorlist.priority, seq: @authorlist.seq, turns: @authorlist.turns } }
    assert_redirected_to authorlist_url(@authorlist)
  end

  test "should destroy authorlist" do
    assert_difference('Authorlist.count', -1) do
      delete authorlist_url(@authorlist)
    end

    assert_redirected_to authorlists_url
  end
end
