import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:onboarding/model/github_data.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Text(user.name),
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
              title: Text(user.repositories[index]['node']['name']),
            );
          },
        )
      ],
    );
  }
}
