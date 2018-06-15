require 'test_helper'

class AltcsrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @altcsr = altcsrs(:one)
  end

  test "should get index" do
    get altcsrs_url
    assert_response :success
  end

  test "should get new" do
    get new_altcsr_url
    assert_response :success
  end

  test "should create altcsr" do
    assert_difference('Altcsr.count') do
      post altcsrs_url, params: { altcsr: { altcsr: @altcsr.altcsr, end: @altcsr.end, start: @altcsr.start, usualcsr: @altcsr.usualcsr } }
    end

    assert_redirected_to altcsr_url(Altcsr.last)
  end

  test "should show altcsr" do
    get altcsr_url(@altcsr)
    assert_response :success
  end

  test "should get edit" do
    get edit_altcsr_url(@altcsr)
    assert_response :success
  end

  test "should update altcsr" do
    patch altcsr_url(@altcsr), params: { altcsr: { altcsr: @altcsr.altcsr, end: @altcsr.end, start: @altcsr.start, usualcsr: @altcsr.usualcsr } }
    assert_redirected_to altcsr_url(@altcsr)
  end

  test "should destroy altcsr" do
    assert_difference('Altcsr.count', -1) do
      delete altcsr_url(@altcsr)
    end

    assert_redirected_to altcsrs_url
  end
end
