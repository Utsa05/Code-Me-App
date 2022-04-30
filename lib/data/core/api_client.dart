import 'dart:convert';

import 'package:code_me/data/core/api_constants.dart';
import 'package:http/http.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String submissionid) async {
    final response = await _client.get(
        Uri.parse('${ApiCons.baseUrl}get-status/$submissionid'),
        headers: {'Content-Type': "application/json"});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, dynamic data) async {
    final response = await _client.post(Uri.parse("${ApiCons.baseUrl}$path"),
        body: jsonEncode(data), headers: {'Content-Type': "application/json"});

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
