// ignore_for_file: file_names

import '../../data/model/home_model/home_model.dart';
import '../../common/services/homeServices.dart';

class HomeRepository {
  final HomeService homeService;

  HomeRepository({required this.homeService});

  //lấy dữ liệu từ server
  Future<List<HomeModel>> fetchHomes({required int startIndex}) {
    return homeService.fetchHomes(startIndex: startIndex);
  }


  //lọc dữ liệu
  List<HomeModel> filterHomes(List<HomeModel> homeModels, String query) {
    final queryLower = query.toLowerCase();

    return homeModels.where((homeModel) {
      final titleLower = homeModel.title.toLowerCase();
      final bodyLower = homeModel.body.toLowerCase();

      return titleLower.contains(queryLower) || bodyLower.contains(queryLower);
    }).toList();
  }
}
