// ignore_for_file: avoid_print

import 'package:onboarding/model/github_data.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:onboarding/GraphQL/connection.dart';
import 'package:onboarding/GraphQL/queries.dart';

class GithubRepository {
  final GraphQLClient _client = clientToQuery();
  final String variable;

  GithubRepository({required this.variable});

  Future<User> fetchData() async {
    print('VAR');
    print(variable);
    QueryResult result = await _client.query(QueryOptions(
        document: gql(query), variables: {"login": variable.trim()}));
    if (!result.hasException) {
      List repositories = result.data?['user']['repositories']['edges'];
      print('---------------------------');
      print(repositories);
      print('---------------------------');
      User user = User(
          avatarUrl: result.data!["user"]["avatarUrl"],
          name: result.data!["user"]["name"],
          email: result.data!["user"]["email"],
          login: result.data!["user"]["login"],
          bio: result.data!["user"]["bio"],
          repositories: repositories);
      return user;
    }

    throw Exception('Ocorreu um erro!');
  }
}
