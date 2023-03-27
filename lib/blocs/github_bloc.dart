import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onboarding/model/github_data.dart';
import 'package:onboarding/repository/github_repository.dart';
import 'package:onboarding/blocs/github_event.dart';
import 'package:onboarding/blocs/github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  // GithubRepository repository;
  final _clientRepo = GithubRepository();
  // GithubState get initialState => InitialSate();
  GithubBloc() : super(GitInitialState()){
    on<Started>((event, emit) => emit());
  };
}
