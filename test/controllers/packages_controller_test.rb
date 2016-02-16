require 'test_helper'

class PackagesControllerTest < ActionController::TestCase
  setup do
    @package = packages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create package" do
    assert_difference('Package.count') do
      post :create, package: { batch_number: @package.batch_number, client_id: @package.client_id, entry_packet_time: @package.entry_packet_time, outbound_packet_time: @package.outbound_packet_time, package_dimentions: @package.package_dimentions, package_weight: @package.package_weight, safeguard_time: @package.safeguard_time }
    end

    assert_redirected_to package_path(assigns(:package))
  end

  test "should show package" do
    get :show, id: @package
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @package
    assert_response :success
  end

  test "should update package" do
    patch :update, id: @package, package: { batch_number: @package.batch_number, client_id: @package.client_id, entry_packet_time: @package.entry_packet_time, outbound_packet_time: @package.outbound_packet_time, package_dimentions: @package.package_dimentions, package_weight: @package.package_weight, safeguard_time: @package.safeguard_time }
    assert_redirected_to package_path(assigns(:package))
  end

  test "should destroy package" do
    assert_difference('Package.count', -1) do
      delete :destroy, id: @package
    end

    assert_redirected_to packages_path
  end
end
