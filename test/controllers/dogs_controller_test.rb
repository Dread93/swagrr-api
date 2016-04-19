require 'test_helper'

class DogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dog = dogs(:one)
  end

  test "should get index" do
    get dogs_url
    assert_response :success
  end

  test "should create dog" do
    assert_difference('Dog.count') do
      post dogs_url, params: { dog: { avatar_url: @dog.avatar_url, bio: @dog.bio, breed_id: @dog.breed_id, handle: @dog.handle, name: @dog.name, sex: @dog.sex, user_id: @dog.user_id, website: @dog.website } }
    end

    assert_response 201
  end

  test "should show dog" do
    get dog_url(@dog)
    assert_response :success
  end

  test "should update dog" do
    patch dog_url(@dog), params: { dog: { avatar_url: @dog.avatar_url, bio: @dog.bio, breed_id: @dog.breed_id, handle: @dog.handle, name: @dog.name, sex: @dog.sex, user_id: @dog.user_id, website: @dog.website } }
    assert_response 200
  end

  test "should destroy dog" do
    assert_difference('Dog.count', -1) do
      delete dog_url(@dog)
    end

    assert_response 204
  end
end
