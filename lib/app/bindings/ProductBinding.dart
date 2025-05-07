import 'package:get/get.dart';
import 'package:getx_app/app/modules/controllers/ProductController.dart';
import 'package:getx_app/app/services/product_service.dart';

class Productbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductService>(() => ProductService());
    Get.lazyPut<ProductController>(
        () => ProductController(productService: Get.find<ProductService>()));
  }
}
