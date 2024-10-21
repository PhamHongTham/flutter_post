// ignore_for_file: file_names

import 'package:http/http.dart';

class ApiClient {
  final Client httpClient;

  ApiClient({required this.httpClient});

  Future<Response> getRequest(Uri uri) async {
    final response = await httpClient.get(uri);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
