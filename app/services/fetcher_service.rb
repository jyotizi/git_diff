class FetcherService
  def initialize(params)
    set_values(params)
  end

  def get_commit
    url = "https://api.github.com/repos/#{@owner}/#{@repo}/commits/#{@sha_id}"
    response = HTTParty.get(url, headers: auth_params)
    response.success? ? response.parsed_response : nil
  end

  def get_commit_diff
    commit = get_commit
    return nil unless commit

    files = commit['files'] || []
    files.map do |file|
      {
        changeKind: file['status'].upcase,
        headFile: { filename: file['filename'] },
        baseFile: {},
        hunks: file['patch'] ? [file['patch']] : []
      }
    end
  end

  private

  def auth_params
    { "Authorization" => "token #{ENV['GITHUB_TOKEN']}" }
  end

  def set_values(params)
    @owner = params[:owner]
    @repo = params[:repo]
    @sha_id = params[:sha_id]
  end
end
