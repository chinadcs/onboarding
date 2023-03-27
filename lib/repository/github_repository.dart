import 'package:onboarding/model/github_data.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:onboarding/GraphQL/connection.dart';
import 'package:onboarding/GraphQL/queries.dart';
import 'package:onboarding/blocs/github_bloc.dart';

class GithubRepository {
  final GraphQLClient _client = clientToQuery();

  Future<User> fetchData() async {
    QueryResult result =
        await _client.query(QueryOptions(document: gql(query)));

    if (!result.hasException) {
      User user = result.data as User;

      return user;
    }

    throw Error();
  }
}
