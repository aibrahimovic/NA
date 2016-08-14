require 'test_helper'

class RolePrivilegesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role_privilege = role_privileges(:one)
  end

  test "should get index" do
    get role_privileges_url
    assert_response :success
  end

  test "should get new" do
    get new_role_privilege_url
    assert_response :success
  end

  test "should create role_privilege" do
    assert_difference('RolePrivilege.count') do
      post role_privileges_url, params: { role_privilege: { privilege_id: @role_privilege.privilege_id, role_id: @role_privilege.role_id } }
    end

    assert_redirected_to role_privilege_url(RolePrivilege.last)
  end

  test "should show role_privilege" do
    get role_privilege_url(@role_privilege)
    assert_response :success
  end

  test "should get edit" do
    get edit_role_privilege_url(@role_privilege)
    assert_response :success
  end

  test "should update role_privilege" do
    patch role_privilege_url(@role_privilege), params: { role_privilege: { privilege_id: @role_privilege.privilege_id, role_id: @role_privilege.role_id } }
    assert_redirected_to role_privilege_url(@role_privilege)
  end

  test "should destroy role_privilege" do
    assert_difference('RolePrivilege.count', -1) do
      delete role_privilege_url(@role_privilege)
    end

    assert_redirected_to role_privileges_url
  end
end
