import 'package:get/get.dart';

import '../../../remote/repository/app_repository.dart';
import '../../../remote/repository/app_repository_impl.dart';
import '../../controller/example_view_model.dart';

class GetExampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppRepository>(AppRepositoryImpl());
    Get.put(ExampleViewModel(api: Get.find<AppRepository>()));
  }
}