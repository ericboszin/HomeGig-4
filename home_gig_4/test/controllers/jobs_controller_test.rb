require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end
  def setup
    sign_in FactoryBot.create(:user)
  end

  test "should get job 1" do
    _id = jobs(:one).id
    get job_path(_id)
    assert_response :success
  end

end
