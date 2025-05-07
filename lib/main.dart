import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_app/app/modules/controllers/cart_controller.dart';
import 'package:getx_app/app/routes/app_pages.dart';
import 'package:getx_app/app/services/cart_services.dart';
import 'package:getx_app/app/services/translation.dart';

void main() async {
  await GetStorage.init();
  Get.put(CartServices());
  Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: AppTranslations(),
      locale: const Locale('en', 'us'),
      fallbackLocale: const Locale('en', 'us'),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.PRODUCT,
      getPages: AppPages.routes,
    );
  }
}
