import 'package:get/get.dart';
import 'package:getx_app/app/modules/models/product_model.dart';
import 'package:getx_app/app/services/cart_services.dart';

class CartController extends GetxController {
  final CartServices cartServices = Get.find<CartServices>();

  List<ProductModel> get cartItems => cartServices.cartItems;

  double get totalAmount => cartServices.calculateTotal;

  void addCart(ProductModel product) {
    cartServices.addItem(product);
  }

  void removeCart(ProductModel product) {
    cartServices.removeItem(product);
  }
}
