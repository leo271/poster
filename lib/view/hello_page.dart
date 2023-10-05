import 'package:firestore_webapp/controller/post_form.dart';
import 'package:firestore_webapp/model/auth_controller.dart';
import 'package:firestore_webapp/view/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HelloPage extends ConsumerWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authAsyncNotifierController.notifier);
    final authRepository = ref.read(authRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                authController.signOutAnonymously(context,
                    builder: (_) => const SignInPage());
              },
              icon: const Icon(Icons.logout))
        ],
        title: Text('Auth:${authRepository.currentUser?.uid ?? ''}'),
      ),
      body: Center(child: PostForm()),
    );
  }
}
