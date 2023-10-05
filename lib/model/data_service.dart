import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_webapp/model/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firestore_webapp/model/data.dart';

final dataRepositoryProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final dataServiceProvider = AsyncNotifierProvider(DataService.new);

class DataService extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  // Firestoreにデータを保存するメソッド
  Future<void> addBlog(BuildContext context, WidgetRef ref,
      {required String title, required String body, t}) async {
    final db = ref.read(dataRepositoryProvider);
    final auth = ref.read(authRepositoryProvider);
    try {
      state = const AsyncLoading();
      if (title.isEmpty) {
        throw ('タイトルが入力されていません!');
      }

      if (body.isEmpty) {
        throw ('投稿内容が入力されていません!');
      }

      // uid取得する変数
      final uid = (auth.currentUser?.uid ?? '') + DateTime.now().toString();
      // Freezedのモデルクラスで定義した型を使ってデータを保存する
      final newBlog = Data(
        id: uid.toString(),
        title: title,
        body: body,
      );
      state = await AsyncValue.guard(
          () => db.collection('blog').doc(uid).set(newBlog.toJson()));
    } catch (e) {
      if (context.mounted) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                // throwのエラーメッセージがダイアログで表示される.
                title: Text(e.toString()),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      }
    }
  }
}
