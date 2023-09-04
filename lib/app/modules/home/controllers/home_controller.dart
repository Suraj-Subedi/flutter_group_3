import 'package:get/get.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increaseCount() {
    count.value++;
  }
}
