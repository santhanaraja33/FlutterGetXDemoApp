import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/routes/app_pages.dart';
import '../models/product_model.dart';
import '../controllers/cart_controller.dart';

class ProductDetailsView extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('product_details'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed(Routes.CART);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('\$${product.price}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartController.addCart(product);
                Get.snackbar(
                    'Added to Cart', '${product.title} added to your cart');
              },
              child: Text('add_to_cart'.tr),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    color: Colors.white,
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.shopping_cart),
                          title: const Text("Go to cart"),
                          onTap: () {
                            Get.toNamed(Routes.CART);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.payment),
                          title: const Text("Payment Options"),
                          onTap: () {
                            Get.toNamed(Routes.CHECKOUT);
                          },
                        ),
                      ],
                    ),
                  ));
                },
                child: const Text("More Options"))
          ],
        ),
      ),
    );
  }
}
