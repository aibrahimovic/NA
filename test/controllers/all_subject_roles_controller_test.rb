require 'test_helper'

class AllSubjectRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @all_subject_role = all_subject_roles(:one)
  end

  test "should get index" do
    get all_subject_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_all_subject_role_url
    assert_response :success
  end

  test "should create all_subject_role" do
    assert_difference('AllSubjectRole.count') do
      post all_subject_roles_url, params: { all_subject_role: { subject_id: @all_subject_role.subject_id, subject_role_id: @all_subject_role.subject_role_id } }
    end

    assert_redirected_to all_subject_role_url(AllSubjectRole.last)
  end

  test "should show all_subject_role" do
    get all_subject_role_url(@all_subject_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_all_subject_role_url(@all_subject_role)
    assert_response :success
  end

  test "should update all_subject_role" do
    patch all_subject_role_url(@all_subject_role), params: { all_subject_role: { subject_id: @all_subject_role.subject_id, subject_role_id: @all_subject_role.subject_role_id } }
    assert_redirected_to all_subject_role_url(@all_subject_role)
  end

  test "should destroy all_subject_role" do
    assert_difference('AllSubjectRole.count', -1) do
      delete all_subject_role_url(@all_subject_role)
    end

    assert_redirected_to all_subject_roles_url
  end
end
