require 'test_helper'

class RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get commits" do
    params = {
      sha_id: "commit_id",
      owner: "name",
      repo: "repo_name"
    }
    get commit_url(params)
    assert_response :success
  end

  test "should not get commits with wrong sha_id" do
    params = {
      sha_id: "wrong_commit_id",
      owner: "name",
      repo: "repo_name"
    }
    get commit_url(params)
    assert_response :not_found
  end

  test "should get diff" do
    params = {
      sha_id: "commit_id",
      owner: "name",
      repo: "repo_name"
    }
    get commit_diff_url(params)
    assert_response :success
  end

  test "should not get diff with wrong owner" do
    params = {
      sha_id: "commit_id",
      owner: "wrong_name",
      repo: "repo_name"
    }
    get commit_diff_url(params)
    assert_response :not_found
  end
end
