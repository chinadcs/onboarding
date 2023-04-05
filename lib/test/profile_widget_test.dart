import 'package:onboarding/model/github_data.dart';
import 'package:onboarding/profile_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('Testing the github profile widget', (tester) async {
    User user = User(
        avatarUrl:
            'https://avatars.githubusercontent.com/u/30187274?s=200&u=7f04307a32dfded6f10549996954e87eb05d4821&v=4',
        name: 'Daniel Campos Sampaio',
        email: 'danpzk0@gmail.com',
        login: 'chinadcs',
        bio: 'Bio',
        repositories: [
          {
            'node': {'name': 'RegressaoLinear'}
          },
          {
            'node': {'name': 'DeteccaoFacial'}
          }
        ]);
    ProfileWidget profile = ProfileWidget(user: user);
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: profile,
        ),
      ));

      await tester.pump();
    });
    expectSync(find.byType(Image), findsOneWidget);
    expectSync(find.text('Daniel Campos Sampaio'), findsOneWidget);
    expectSync(find.text('danpzk0@gmail.com'), findsOneWidget);
    expectSync(find.text('chinadcs'), findsOneWidget);
    expectSync(find.text('Bio'), findsOneWidget);
    expectSync(find.text('DeteccaoFacial'), findsOneWidget);
  });
}
