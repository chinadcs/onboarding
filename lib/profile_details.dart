import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key, required this.username});
  final String username;
  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    String readRepositories = """
    query GithubGraphQL(\$login: String!) {
  user(login: \$login) {
    avatarUrl(size: 200)
    name
    email
    login
    bio
    repositories(first: 10) {
      pageInfo {
        endCursor
        startCursor
      }
      totalCount
      edges {
        node {
          id
          name
          viewerHasStarred
        }
      }
    }
    followers {
      totalCount
    }
    following {
      totalCount
    }
  }
}
      """;
    return Center(
      child: Query(
        options: QueryOptions(
            document: gql(readRepositories),
            variables: {'login': widget.username.trim()}),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Text('Loading...');
          }

          print(result.data);

          final userDetails = result.data?['user'];
          List repositories = result.data?['user']['repositories']['edges'];
          print(repositories);
          return Stack(
            children: [
              Column(
                children: [
                  ClipOval(
                    child: Image.network(
                      userDetails['avatarUrl'],
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    userDetails['bio'],
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
