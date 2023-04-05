import 'package:flutter/material.dart';
import 'package:onboarding/blocs/github_bloc.dart';
import 'package:onboarding/blocs/github_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/blocs/github_state.dart';
import 'package:onboarding/model/github_data.dart';
import 'package:onboarding/profile_widget.dart';
import 'package:onboarding/repository/github_repository.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({super.key, required this.username});
  final String username;

  // late final GithubBloc bloc;

  late final GithubRepository repository = GithubRepository(variable: username);

  // @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GithubBloc>(
            create: (context) =>
                GithubBloc(repository: repository)..add(Started()))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(username),
        ),
        body: BlocBuilder<GithubBloc, GithubState>(
            // bloc: bloc,
            builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            User user = state.user!;
            return Center(
              child: SingleChildScrollView(
                child: ProfileWidget(user: user),
              ),
            );
          } else {
            return const Center(
              child: Text('Error!'),
            );
          }
        }),
      ),
    );
  }
}
