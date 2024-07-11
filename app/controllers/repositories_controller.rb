class RepositoriesController < ApplicationController
  def commit
    commit_details = FetcherService.new(params).get_commit
    send_response(commit_details)
  end

  def commit_diff
    commit_details = FetcherService.new(params).get_commit_diff
    send_response(commit_details)
  end

  private

  def send_response(data)
    if data
      render json: data
    else
      render json: { error: "Commit not found" }, status: :not_found
    end
  end
end
