import 'package:firestore_webapp/view/hello_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firestore_webapp/model/auth_controller.dart';
import 'package:firestore_webapp/controller/auth_button.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignInPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthButton(
                text: '登録せずに利用',
                onPressed: () => ref
                    .read(authAsyncNotifierController.notifier)
                    .signInAnonymously(context,
                        builder: (_) => const HelloPage())),
          ],
        ),
      ),
    );
  }
}
