String query = """
query GithubGraphQL(\$login: String!) {
  user(login: \$login) {
    avatarUrl(size: 200)
    name
    email
    login
    bio
    repositories(first: 10) {
      edges {
        node {
          id
          name
        }
      }
    }
  }
}
""";
