import 'package:flutter/material.dart';
import 'package:onboarding/blocs/github_bloc.dart';
import 'package:onboarding/blocs/github_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/blocs/github_state.dart';
import 'package:onboarding/model/github_data.dart';
import 'package:onboarding/repository/github_repository.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key, required this.username});
  final String username;
  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  late final GithubBloc bloc;
  late GithubRepository repository =
      GithubRepository(variable: widget.username);

  @override
  void initState() {
    super.initState();
    bloc = GithubBloc(repository: repository);
    bloc.add(Started());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.username),),
      body: BlocBuilder<GithubBloc, GithubState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedState) {
              User user = state.user!;
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      ClipOval(
                        child: Image.network(
                          user.avatarUrl,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),

                      const SizedBox(height: 5),
                      Text('Name: ${user.name}'),
                      const SizedBox(height: 5),
                      Text(user.login),
                      const SizedBox(height: 5),
                      Text(user.email),
                      const SizedBox(height: 5),
                      Text(user.bio),
                      const SizedBox(height: 5),
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: user.repositories.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text(user.repositories[index]['node']['name']),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('Error!'),
              );
            }
          }),
    );
  }
}
