import 'package:find/Models/categModel.dart';
import 'package:find/Services/categCall.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = List<Categories>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var products = await ProductService().getProducts();
    if (products != null) {
      productList.assignAll(products);
    }
  }
}
