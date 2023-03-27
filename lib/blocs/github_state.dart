// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:onboarding/model/github_data.dart';

abstract class GithubState {
  List<User> user;
  GithubState({
    required this.user,
  });
}

class LoadingState extends GithubState {
  LoadingState() : super(user: []);
}

class GitInitialState extends GithubState {
  GitInitialState() : super(user: []);
}

class LoadedState extends GithubState {
  LoadedState({required List<User> user}) : super(user: user);
}

class ErrorState extends GithubState {
  ErrorState() : super(user: []);
}
