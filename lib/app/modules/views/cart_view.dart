import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/modules/controllers/cart_controller.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text('\$${item.price}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {
                        Get.defaultDialog(
                            title: "Remove Item",
                            middleText:
                                "Are you sure want to remove ${item.title} from the cart ?",
                            textConfirm: "Yes",
                            textCancel: "No",
                            confirmTextColor: Colors.white,
                            onConfirm: () {
                              cartController.removeCart(item);
                              Get.back();
                            },
                            onCancel: () {});
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Total: \$${cartController.totalAmount}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to checkout page
                      Get.toNamed(Routes.CHECKOUT);
                    },
                    child: const Text("Proceed to checkout"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
