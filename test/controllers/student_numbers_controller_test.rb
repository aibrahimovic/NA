require 'test_helper'

class StudentNumbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_number = student_numbers(:one)
  end

  test "should get index" do
    get student_numbers_url
    assert_response :success
  end

  test "should get new" do
    get new_student_number_url
    assert_response :success
  end

  test "should create student_number" do
    assert_difference('StudentNumber.count') do
      post student_numbers_url, params: { student_number: { academic_year: @student_number.academic_year, predicted_student_number: @student_number.predicted_student_number, student_number: @student_number.student_number, subject_id: @student_number.subject_id } }
    end

    assert_redirected_to student_number_url(StudentNumber.last)
  end

  test "should show student_number" do
    get student_number_url(@student_number)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_number_url(@student_number)
    assert_response :success
  end

  test "should update student_number" do
    patch student_number_url(@student_number), params: { student_number: { academic_year: @student_number.academic_year, predicted_student_number: @student_number.predicted_student_number, student_number: @student_number.student_number, subject_id: @student_number.subject_id } }
    assert_redirected_to student_number_url(@student_number)
  end

  test "should destroy student_number" do
    assert_difference('StudentNumber.count', -1) do
      delete student_number_url(@student_number)
    end

    assert_redirected_to student_numbers_url
  end
end
