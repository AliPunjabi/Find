import 'package:find/Models/categModel.dart';
import 'package:http/http.dart' as http;


class ProductService {
  static const String url = 'https://fakestoreapi.com/products';

  Future<List<Categories>> getProducts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return categoriesFromJson(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}