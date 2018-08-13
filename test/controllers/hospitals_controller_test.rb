require 'test_helper'

class HospitalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hospital = hospitals(:one)
  end

  test "should get index" do
    get hospitals_url
    assert_response :success
  end

  test "should get new" do
    get new_hospital_url
    assert_response :success
  end

  test "should create hospital" do
    assert_difference('Hospital.count') do
      post hospitals_url, params: { hospital: { address: @hospital.address, caption: @hospital.caption, description: @hospital.description, hospital_image: @hospital.hospital_image, latitude: @hospital.latitude, longitude: @hospital.longitude, name: @hospital.name, pet: @hospital.pet, tag: @hospital.tag, tel: @hospital.tel, time_id: @hospital.time_id } }
    end

    assert_redirected_to hospital_url(Hospital.last)
  end

  test "should show hospital" do
    get hospital_url(@hospital)
    assert_response :success
  end

  test "should get edit" do
    get edit_hospital_url(@hospital)
    assert_response :success
  end

  test "should update hospital" do
    patch hospital_url(@hospital), params: { hospital: { address: @hospital.address, caption: @hospital.caption, description: @hospital.description, hospital_image: @hospital.hospital_image, latitude: @hospital.latitude, longitude: @hospital.longitude, name: @hospital.name, pet: @hospital.pet, tag: @hospital.tag, tel: @hospital.tel, time_id: @hospital.time_id } }
    assert_redirected_to hospital_url(@hospital)
  end

  test "should destroy hospital" do
    assert_difference('Hospital.count', -1) do
      delete hospital_url(@hospital)
    end

    assert_redirected_to hospitals_url
  end
end
