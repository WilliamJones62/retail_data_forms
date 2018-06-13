require 'test_helper'

class CalllistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calllist = calllists(:one)
  end

  test "should get index" do
    get calllists_url
    assert_response :success
  end

  test "should get new" do
    get new_calllist_url
    assert_response :success
  end

  test "should create calllist" do
    assert_difference('Calllist.count') do
      post calllists_url, params: { calllist: { altrep: @calllist.altrep, csr: @calllist.csr, custcode: @calllist.custcode, custname: @calllist.custname, day: @calllist.day, dept: @calllist.dept, dontcall: @calllist.dontcall, endar: @calllist.endar, enddc: @calllist.enddc, ends: @calllist.ends, item: @calllist.item, manager: @calllist.manager, phone: @calllist.phone, reason: @calllist.reason, rep: @calllist.rep, shipto: @calllist.shipto, special: @calllist.special, startar: @calllist.startar, startdc: @calllist.startdc, starts: @calllist.starts, totalitems: @calllist.totalitems } }
    end

    assert_redirected_to calllist_url(Calllist.last)
  end

  test "should show calllist" do
    get calllist_url(@calllist)
    assert_response :success
  end

  test "should get edit" do
    get edit_calllist_url(@calllist)
    assert_response :success
  end

  test "should update calllist" do
    patch calllist_url(@calllist), params: { calllist: { altrep: @calllist.altrep, csr: @calllist.csr, custcode: @calllist.custcode, custname: @calllist.custname, day: @calllist.day, dept: @calllist.dept, dontcall: @calllist.dontcall, endar: @calllist.endar, enddc: @calllist.enddc, ends: @calllist.ends, item: @calllist.item, manager: @calllist.manager, phone: @calllist.phone, reason: @calllist.reason, rep: @calllist.rep, shipto: @calllist.shipto, special: @calllist.special, startar: @calllist.startar, startdc: @calllist.startdc, starts: @calllist.starts, totalitems: @calllist.totalitems } }
    assert_redirected_to calllist_url(@calllist)
  end

  test "should destroy calllist" do
    assert_difference('Calllist.count', -1) do
      delete calllist_url(@calllist)
    end

    assert_redirected_to calllists_url
  end
end
