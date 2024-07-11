### About The Project
This project utilizes Ruby on Rails to create API endpoints for retrieving commit details and differences from a GitHub repository,leveraging the GitHub API with PostgreSQL as the underlying database.

## Setup

To set up the project, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/jyotizi/git_diff
   cd git_diff
2. Install dependencies:
   ```bash
   bundle install
3. Set up the PostgreSQL database:
   ```bash
   rails db:setup
4. Create a .env file for your GitHub Personal Access Token and add .env to .gitignore:
   [Know how to get personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
   ```bash
   GITHUB_TOKEN=github_personal_access_token
5. Start the server:
   ```bash
   rails server
## API Endpoints implemented in the app
### Get Commit Details:
   `GET /repos/:owner/:repo/commits/:sha_id`

   Fetches metadata about a specific commit.

### Get Commit Diff:
   `GET /repos/:owner/:repo/commits/:sha_id/diff`

   Fetches the list of files in the commit, including the diff of each file.
### Test API Endpoints using curl request
```bash
curl -X GET "http://localhost:3000/repos/" \
-H "Authorization: token YOUR_GITHUB_TOKEN" \
-H "Content-Type: application/json"
```

```bash
curl -X GET "http://localhost:3000/repos/" \
-H "Authorization: token YOUR_GITHUB_TOKEN" \
-H "Content-Type: application/json"
```

## Necessary API Endpoints
### Get all the commits
   `GET /repos/{owner}/{repo}/commits`

   Fetches all the commits in the repo.

### Get all the child branches of the commit
   `GET /repos/{owner}/{repo}/commits/{commit_sha}/branches-where-head`

   Fetches all the child branches of the given commit.

### Get diff between two commits
   `GET /repos/{owner}/{repo}/compare/{basehead}`

   Compare two commits.

### there are more Endpoints available, to get the details of repo.
