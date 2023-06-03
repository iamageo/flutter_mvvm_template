import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/viewmodel/example_view_model.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../remote/response/api_status.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  final ExampleViewModel viewModel = Get.put(ExampleViewModel());

  @override
  void initState() {
    viewModel.fetchDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVVM Flutter Template"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            switch (viewModel.baseResponse.value.status) {
              case Status.LOADING:
                return buildShimmerEffect();
              case Status.ERROR:
                return buildUserError();
              case Status.COMPLETED:
                return buildUserList();
              default:
                return Container();
            }
          })
        ],
      ),
    );
  }

  Padding buildUserError() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
              alignment: Alignment.center,
              child: Text('Ops, ocorreu um erro, tente novamente. ${viewModel.baseResponse.value.message}')),
          ElevatedButton(
              onPressed: () {
                viewModel.fetchDataFromApi();
              },
              child: const Text("Tentar novamente"))
        ],
      ),
    );
  }

  Expanded buildUserList() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        itemCount: viewModel.baseResponse.value.data?.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(viewModel.baseResponse.value.data![index].name!));
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
