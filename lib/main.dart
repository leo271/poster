import 'package:firestore_webapp/view/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'model/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Firestore WebApp';

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: _title,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const SignInPage(),
      ),
    );
  }
}
