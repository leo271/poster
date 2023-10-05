import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_webapp/model/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogStreamProvider = StreamProvider<List<Data>>((ref) {
  final collection = FirebaseFirestore.instance.collection('blog');

  final stream = collection.snapshots().map(
        (e) => e.docs.map((e) => Data.fromJson(e.data())).toList(),
      );
  return stream;
});
