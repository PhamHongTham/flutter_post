import 'package:equatable/equatable.dart';
import 'package:post/gen/assets.gen.dart';

final class HomeModel extends Equatable {
  final int id;
  final String title;
  final String body;
  final String imageUrl;

  const HomeModel(
      {required this.id,
      required this.title,
      required this.body,
      required this.imageUrl});
  @override
  List<Object?> get props => [id, title, body];

//chuyển đổi thành JSON để lưu trữ dữ liệu vào SharedPreferences
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'imageUrl': imageUrl,
    };
  }

  // Tạo đối tượng từ JSON
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      imageUrl: json['imageUrl'],
    );
  }
}

final List<String> imageUrls = [
  Assets.images.img1,
  Assets.images.img2,
  Assets.images.img3,
  Assets.images.img4
];
