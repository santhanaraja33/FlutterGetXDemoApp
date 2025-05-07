import 'package:get/get.dart';
import 'package:getx_app/app/modules/models/product_model.dart';
import 'package:getx_app/app/services/product_service.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var errorMessage = ''.obs;
  var isLoading = true.obs;

  final ProductService productService;

  ProductController({required this.productService});

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(false);
      errorMessage('');
      var productsfromAPI = await productService.fetchProducts();
      products.assignAll(productsfromAPI);
    } catch (e) {
      errorMessage('Failed to fetch products');
    } finally {
      isLoading(false);
    }
  }
}
