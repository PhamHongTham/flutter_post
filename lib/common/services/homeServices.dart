// ignore_for_file: file_names

import 'dart:convert';

import '../../data/model/home_model/home_model.dart';
import 'apiClient.dart';
import '../constants/constant.dart';

class HomeService {
  final ApiClient apiClient;

  HomeService({required this.apiClient});

  Future<List<HomeModel>> fetchHomes({required int startIndex}) async {
    final uri = Uri.https(
      baseUrl,
      postsEndpoint,
      <String, String>{'_start': '$startIndex', '_limit': '$homeLimit'},
    );
    final response = await apiClient.getRequest(uri);
    final body = json.decode(response.body) as List;

    return body.map((dynamic json) {
      final map = json as Map<String, dynamic>;
      return HomeModel(
        id: map['id'] as int,
        title: map['title'] as String,
        body: map['body'] as String,
        imageUrl: imageUrls[map['id'] % 4],
      );
    }).toList();
  }
}
