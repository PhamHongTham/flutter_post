part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class AddFavorite extends FavoriteEvent {
  final HomeModel post;

  const AddFavorite(this.post);

  @override
  List<Object> get props => [post];
}

class RemoveFavorite extends FavoriteEvent {
  final HomeModel post;

  const RemoveFavorite(this.post);

  @override
  List<Object> get props => [post];
}
