require 'test_helper'

class ParksControllerTest < ActionController::TestCase
  setup do
    @park = parks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create park" do
    assert_difference('Park.count') do
      post :create, park: { address: @park.address, area: @park.area, ball_fields: @park.ball_fields, basketball_courts: @park.basketball_courts, classification: @park.classification, covbb: @park.covbb, dog_park: @park.dog_park, gazebos: @park.gazebos, gix_ac: @park.gix_ac, golf: @park.golf, grills: @park.grills, gym: @park.gym, name: @park.name, nat: @park.nat, parking_spaces: @park.parking_spaces, pavilions: @park.pavilions, picnic_Tables: @park.picnic_Tables, picnic_shelters: @park.picnic_shelters, playgrounds: @park.playgrounds, pool: @park.pool, recreation_center: @park.recreation_center, restrooms: @park.restrooms, soccer_fields: @park.soccer_fields, tennis_courts: @park.tennis_courts, track: @park.track, volleyball_courts: @park.volleyball_courts, zip_code: @park.zip_code }
    end

    assert_redirected_to park_path(assigns(:park))
  end

  test "should show park" do
    get :show, id: @park
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @park
    assert_response :success
  end

  test "should update park" do
    put :update, id: @park, park: { address: @park.address, area: @park.area, ball_fields: @park.ball_fields, basketball_courts: @park.basketball_courts, classification: @park.classification, covbb: @park.covbb, dog_park: @park.dog_park, gazebos: @park.gazebos, gix_ac: @park.gix_ac, golf: @park.golf, grills: @park.grills, gym: @park.gym, name: @park.name, nat: @park.nat, parking_spaces: @park.parking_spaces, pavilions: @park.pavilions, picnic_Tables: @park.picnic_Tables, picnic_shelters: @park.picnic_shelters, playgrounds: @park.playgrounds, pool: @park.pool, recreation_center: @park.recreation_center, restrooms: @park.restrooms, soccer_fields: @park.soccer_fields, tennis_courts: @park.tennis_courts, track: @park.track, volleyball_courts: @park.volleyball_courts, zip_code: @park.zip_code }
    assert_redirected_to park_path(assigns(:park))
  end

  test "should destroy park" do
    assert_difference('Park.count', -1) do
      delete :destroy, id: @park
    end

    assert_redirected_to parks_path
  end
end
