import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/remote/model/base_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../remote/response/api_status.dart';
import '../viewmodel/example_view_model.dart';

class PostExampleScreen extends StatefulWidget {
  const PostExampleScreen({super.key});

  @override
  State<PostExampleScreen> createState() => _PostExampleScreenState();
}

class _PostExampleScreenState extends State<PostExampleScreen> {
  final ExampleViewModel viewModel = Get.put(ExampleViewModel());

  TextEditingController userIdController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("post example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(
                hintText: "userId",
              ),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "title",
              ),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                hintText: "body",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  viewModel.sendDataFromApi(BaseModel(
                      userId: int.parse(userIdController.text),
                      title: titleController.text.trim(),
                      body: bodyController.text.trim()));
                },
                child: const Text("ENVIAR")),
            Obx(() {
              switch (viewModel.postResponse.value.status) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return const Text(
                      "Ocorreu algum erro ao realizar o post, tente novamente.");
                case Status.COMPLETED:
                  return buildPostSuccess();
                default:
                  return Container();
              }
            })
          ],
        ),
      ),
    );
  }

  Widget buildPostSuccess() {
    return Column(
      children: [
        Text(viewModel.postResponse.value.data!.userId.toString()),
        Text(viewModel.postResponse.value.data!.id.toString()),
        Text(viewModel.postResponse.value.data!.title.toString()),
        Text(viewModel.postResponse.value.data!.body.toString()),
      ],
    );
  }
}
