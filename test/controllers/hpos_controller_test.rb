require "test_helper"

class HposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hpo = hpos(:one)
  end

  test "should get index" do
    get hpos_url, as: :json
    assert_response :success
  end

  test "should create hpo" do
    assert_difference("Hpo.count") do
      post hpos_url, params: { hpo: { frequency_id: @hpo.frequency_id, hpo_id: @hpo.hpo_id, term: @hpo.term } }, as: :json
    end

    assert_response :created
  end

  test "should show hpo" do
    get hpo_url(@hpo), as: :json
    assert_response :success
  end

  test "should update hpo" do
    patch hpo_url(@hpo), params: { hpo: { frequency_id: @hpo.frequency_id, hpo_id: @hpo.hpo_id, term: @hpo.term } }, as: :json
    assert_response :success
  end

  test "should destroy hpo" do
    assert_difference("Hpo.count", -1) do
      delete hpo_url(@hpo), as: :json
    end

    assert_response :no_content
  end
end
