import 'package:get/get.dart';
import 'package:getx_app/app/modules/views/cart_view.dart';
import 'package:getx_app/app/modules/views/checkout_view.dart';
import 'package:getx_app/app/modules/views/product_details_view.dart';
import 'package:getx_app/app/modules/views/product_view.dart';

import '../bindings/CartBinding.dart';
import '../bindings/ProductBinding.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductView(),
      binding: Productbinding(),
    ),
    GetPage(name: Routes.PRODUCT_DETAILS, page: () => ProductDetailsView()),
    GetPage(
      name: Routes.CART,
      page: () => CartView(),
      binding: Cartbinding(),
    ),
    GetPage(
      name: Routes.CHECKOUT,
      page: () => CheckoutView(),
    ),
  ];
}
