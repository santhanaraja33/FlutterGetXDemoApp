import 'package:get/get.dart';
import 'package:getx_app/app/modules/controllers/cart_controller.dart';

class Cartbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
