Rails.application.routes.draw do
  get '/repos/:owner/:repo/commits/:sha_id', to: 'repositories#commit', as: 'commit'
  get '/repos/:owner/:repo/commits/:sha_id/diff', to: 'repositories#commit_diff', as: 'commit_diff'
end
