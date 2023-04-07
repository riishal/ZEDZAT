import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/modelpage.dart';

class DataProvider with ChangeNotifier {
  // ignore: non_constant_identifier_names
  List<Datas> Data = [];

  fetchData() async {
    final response = await http.get(Uri.parse(
        "https://service-zedzat.tequevia.com/api/v1/zedzat/product-category/?category_type=product"));
    if (response.statusCode == 200) {
      Data = datasFromJson(response.body);
    } else {
      throw Exception('faild');
    }
    notifyListeners();
  }
}
