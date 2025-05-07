import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/modules/controllers/cart_controller.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckOut"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Thank you for your purchase!",
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final CartController cartController =
                    Get.find<CartController>();

                cartController.cartItems.clear();

                Get.snackbar("Order Completed",
                    "Your order has beed successfully placed!",
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.blue,
                    colorText: Colors.white);

                Get.offAllNamed(Routes.PRODUCT); // Navigate to home page
              },
              child: const Text("Place Order"),
            ),
          ],
        ),
      ),
    );
  }
}
