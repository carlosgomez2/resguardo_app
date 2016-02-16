require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { address: @client.address, birth: @client.birth, cellphone: @client.cellphone, city: @client.city, email: @client.email, emergency_contact_address: @client.emergency_contact_address, emergency_contact_full_name: @client.emergency_contact_full_name, emergency_contact_phone: @client.emergency_contact_phone, first_name: @client.first_name, last_name: @client.last_name, postal_code: @client.postal_code, principal_phone: @client.principal_phone, second_last_name: @client.second_last_name, second_name: @client.second_name, state: @client.state }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { address: @client.address, birth: @client.birth, cellphone: @client.cellphone, city: @client.city, email: @client.email, emergency_contact_address: @client.emergency_contact_address, emergency_contact_full_name: @client.emergency_contact_full_name, emergency_contact_phone: @client.emergency_contact_phone, first_name: @client.first_name, last_name: @client.last_name, postal_code: @client.postal_code, principal_phone: @client.principal_phone, second_last_name: @client.second_last_name, second_name: @client.second_name, state: @client.state }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
