import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart'; // 先頭の文字をファイル名と同じ名前にする
part 'data.g.dart'; // 先頭の文字をファイル名と同じ名前にする

@freezed
class Data with _$Data {
  const factory Data({
    required String id,
    required String title,
    required String body,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
