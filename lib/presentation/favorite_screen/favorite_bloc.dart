import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/home_model/home_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteInitial(<HomeModel>[])) {
    on<AddFavorite>(_onAddFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
    _loadFavorites(); // Tải danh sách yêu thích khi Bloc được khởi tạo
  }

  // Thêm bài viết vào danh sách yêu thích
  void _onAddFavorite(AddFavorite event, Emitter emit) async {
    if (state is FavoriteInitial) {
      final updatedFavorites =
          List<HomeModel>.from((state as FavoriteInitial).favorites)
            ..add(event.post);
      emit(FavoriteInitial(updatedFavorites));
      await _saveFavorites(updatedFavorites); // Lưu lại danh sách
    }
  }

  // Xóa bài viết khỏi danh sách yêu thích
  void _onRemoveFavorite(RemoveFavorite event, Emitter emit) async {
    if (state is FavoriteInitial) {
      final updatedFavorites =
          List<HomeModel>.from((state as FavoriteInitial).favorites)
            ..remove(event.post);
      emit(FavoriteInitial(updatedFavorites));
      await _saveFavorites(updatedFavorites); // Lưu lại danh sách
    }
  }

  // Tải danh sách yêu thích từ SharedPreferences
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteListString = prefs.getString('favorite_posts');
    if (favoriteListString != null) {
      final List<dynamic> favoriteJson = json.decode(favoriteListString);
      final favoritePosts =
          favoriteJson.map((jsonItem) => HomeModel.fromJson(jsonItem)).toList();
      // ignore: invalid_use_of_visible_for_testing_member
      emit(FavoriteInitial(favoritePosts));
    }
  }

  // Lưu danh sách yêu thích vào SharedPreferences
  Future<void> _saveFavorites(List<HomeModel> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteJson =
        json.encode(favorites.map((post) => post.toJson()).toList());
    await prefs.setString('favorite_posts', favoriteJson);
  }

  // Kiểm tra xem bài viết có trong danh sách yêu thích hay không
  bool isFavorite(HomeModel post) {
    if (state is FavoriteInitial) {
      return (state as FavoriteInitial).favorites.contains(post);
    }
    return false;
  }
}
