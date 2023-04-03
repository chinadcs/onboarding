// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:onboarding/model/github_data.dart';

abstract class GithubState {
  User? user;
  GithubState({
    required this.user,
  });
}

class LoadingState extends GithubState {
  LoadingState() : super(user: null);
}

class GitInitialState extends GithubState {
  GitInitialState() : super(user: null);
}

class LoadedState extends GithubState {
  LoadedState({required User user}) : super(user: user);
}

class ErrorState extends GithubState {
  ErrorState() : super(user: null);
}
