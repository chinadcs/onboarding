import 'package:graphql_flutter/graphql_flutter.dart';

void client() async {
  await initHiveForFlutter();
}

const String token = "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";
final HttpLink httpLink = HttpLink('https://api.github.com/graphql');
final AuthLink authLink = AuthLink(
  getToken: () async => 'Bearer $token',
);
final Link link = authLink.concat(httpLink);

GraphQLClient clientToQuery() {
  client();
  return GraphQLClient(
    // cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    cache: GraphQLCache(store: HiveStore()),
    link: link,
  );
}
