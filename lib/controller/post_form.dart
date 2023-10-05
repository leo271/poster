import 'package:firestore_webapp/model/data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostForm extends ConsumerWidget {
  final int width;
  final int height;
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  PostForm({super.key, this.width = 400, this.height = 170});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataServiceState = ref.watch(dataServiceProvider);
    final dataService = ref.read(dataServiceProvider.notifier);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      width: width.toDouble(),
      height: height.toDouble(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("タイトル\t"),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: titleController,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text("内容\t"),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: bodyController,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: dataServiceState.isLoading
                  ? null
                  : () async {
                      dataService.addBlog(context, ref,
                          title: titleController.text,
                          body: bodyController.text);
                      titleController.text = "";
                      bodyController.text = "";
                    },
              child: dataServiceState.isLoading
                  ? const CircularProgressIndicator()
                  : const Text("投稿")),
        ]),
      ),
    );
  }
}
