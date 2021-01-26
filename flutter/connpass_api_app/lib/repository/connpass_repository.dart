import 'dart:convert';

import 'package:connpass_api_app/model/event_model.dart';
import 'package:connpass_api_app/model/connpass_model.dart';
import 'package:http/http.dart' as http;
class ConnpassRepository {

  Future<ConnpassModel> getSearchModel(String searchWord) async {
    final response = await http.get('https://connpass.com/api/v1/event/?count=100&order=1&keyword=$searchWord');
    if(response.statusCode == 200) {
      final parsed =
      json.decode(response.body).cast<String, dynamic>()
      as Map<String, dynamic>;
      final model = ConnpassModel.fromJson(parsed);
      return model;
    } else {
      throw Exception('Fail to search repository');
    }
  }

}

