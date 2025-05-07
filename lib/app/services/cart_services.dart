import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_app/app/modules/models/product_model.dart';

class CartServices extends GetxService {
  final storage = GetStorage();
  var cartItems = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    List? storeCart = storage.read<List>('cartItems');

    if (storeCart != null) {
      cartItems
          .assignAll(storeCart.map((e) => ProductModel.fromJson(e)).toList());
    }

    ever(cartItems, (_) {
      storage.write('cartItems', cartItems.map((e) => e.toJson()).toList());
    });
  }

  void addItem(ProductModel item) {
    cartItems.add(item);
  }

  void removeItem(ProductModel item) {
    cartItems.remove(item);
  }

  void clearCart() {
    cartItems.clear();
  }

  double get calculateTotal {
    return cartItems.fold(0.0, (sum, item) => sum + item.price);
  }
}
