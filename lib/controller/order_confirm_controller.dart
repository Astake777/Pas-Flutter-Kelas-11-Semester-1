import 'package:pas_flutter_18_november/models/order_model.dart';
import 'package:get/get.dart';

class OrderConfirmController extends GetxController {
  late OrderModel order;

  @override
  void onInit() {
    super.onInit();
    order = Get.arguments;
  }
}

