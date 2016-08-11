require 'test_helper'

class SubjectRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject_role = subject_roles(:one)
  end

  test "should get index" do
    get subject_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_role_url
    assert_response :success
  end

  test "should create subject_role" do
    assert_difference('SubjectRole.count') do
      post subject_roles_url, params: { subject_role: { name: @subject_role.name } }
    end

    assert_redirected_to subject_role_url(SubjectRole.last)
  end

  test "should show subject_role" do
    get subject_role_url(@subject_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_role_url(@subject_role)
    assert_response :success
  end

  test "should update subject_role" do
    patch subject_role_url(@subject_role), params: { subject_role: { name: @subject_role.name } }
    assert_redirected_to subject_role_url(@subject_role)
  end

  test "should destroy subject_role" do
    assert_difference('SubjectRole.count', -1) do
      delete subject_role_url(@subject_role)
    end

    assert_redirected_to subject_roles_url
  end
end
