import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latihan_simplean/api/api_url.dart';
import 'package:latihan_simplean/models/kecamatan_model.dart';

class KecamatanProv {
  String baseUrl = ApiUrl.BASE_URL;

  KecamatanModel parseKecamatanModel(http.Response response) {
    final respString = jsonDecode(response.body);
    // print(response.body);
    if (response.statusCode == 200) {
      // print(respString);
      return KecamatanModel.fromJson(respString);
    } else {
      throw Exception('Load data error atau failed');
    }
  }

  Future<KecamatanModel> fetchDataKecamatan() async {
    final response = await http.get(baseUrl);

    return parseKecamatanModel(response);
  }
}
