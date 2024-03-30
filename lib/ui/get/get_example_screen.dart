import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/remote/model/base_model.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/example_view_model.dart';


class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  ExampleViewModel viewModel = Get.find<ExampleViewModel>();

  @override
  void initState() {
    viewModel.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("get example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            return viewModel.getResponse!.value.when(
              loading: () => buildShimmerEffect(),
              success: (list) => buildUserList(list),
              error: (message) => buildUserError(message),
            );
          })
        ],
      ),
    );
  }

  Padding buildUserError(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
              alignment: Alignment.center,
              child: Text('Ops, ocorreu um erro, tente novamente. ${message}')),
          ElevatedButton(
              onPressed: () {
                viewModel.getPosts();
              },
              child: const Text("Tentar novamente"))
        ],
      ),
    );
  }

  Expanded buildUserList(List<BaseModel> list) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            leading: const FlutterLogo(),
              title: Text(list[index].title!), children: [
                Text(list[index].body!, style: const TextStyle(),)
          ],);
        },
      ),
    );
  }

  Expanded buildShimmerEffect() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: SizedBox(
              height: 30,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  child: const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
