import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/remote/response/api_response.dart';
import 'package:get/get.dart';

import '../../remote/model/base_model.dart';
import '../controller/example_view_model.dart';

class PostExampleScreen extends StatefulWidget {
  const PostExampleScreen({super.key});

  @override
  State<PostExampleScreen> createState() => _PostExampleScreenState();
}

class _PostExampleScreenState extends State<PostExampleScreen> {

  ExampleViewModel viewModel = Get.find<ExampleViewModel>();

  TextEditingController userIdController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("post example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                validator: (s) {
                  if (s!.isEmpty) {
                    return "Preencha o campo";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: userIdController,
                decoration: const InputDecoration(
                  hintText: "userId",
                ),
              ),
              TextFormField(
                validator: (s) {
                  if (s!.isEmpty) {
                    return "Preencha o campo";
                  }
                  return null;
                },
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "title",
                ),
              ),
              TextFormField(
                validator: (s) {
                  if (s!.isEmpty) {
                    return "Preencha o campo";
                  }
                  return null;
                },
                controller: bodyController,
                decoration: const InputDecoration(
                  hintText: "body",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        viewModel.sendPost(
                            model: BaseModel(
                                userId: int.parse(userIdController.text),
                                title: titleController.text.trim(),
                                body: bodyController.text.trim()));
                      }
                    },
                    child: const Text("ENVIAR")),
              ),
              Obx(() {
                return viewModel.postResponse.value.when(
                  loading: () => Container(),
                  success: (data) => buildPostSuccess(data),
                  error: (message) => const Text(
                      "Ocorreu algum erro ao realizar o post, tente novamente."),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPostSuccess(BaseModel baseModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Resposta do post: ", style: TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 4,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("userID: ${baseModel.userId}"),
              Text("ID do post: ${baseModel.id}"),
              Text("Título: ${baseModel.title}"),
              Text("Body: ${baseModel.body}"),
            ],
          ),
        ],
      ),
    );
  }
}
