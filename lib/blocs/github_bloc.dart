import 'package:bloc/bloc.dart';
import 'package:onboarding/repository/github_repository.dart';
import 'package:onboarding/blocs/github_event.dart';
import 'package:onboarding/blocs/github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  GithubRepository repository;
  // final _clientRepo = GithubRepository();
  // GithubState get initialState => InitialSate();
  GithubBloc({required this.repository}) : super(GitInitialState()) {
    on<Started>((event, emit) => _onScreenStarted(emit));
  }

  Future<void> _onScreenStarted(
    final Emitter<GithubState> emit,
  ) async {
    emit(LoadingState());

    final user = await repository.fetchData();

    if(user == null){
      emit(ErrorState());
    }
    else{
      emit(LoadedState(user: user));
    }
    
  }
}
