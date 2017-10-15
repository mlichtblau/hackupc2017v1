require 'test_helper'

class ScoreControllerTest < ActionDispatch::IntegrationTest
  test "should get generate_score" do
    get score_generate_score_url
    assert_response :success
  end

end
