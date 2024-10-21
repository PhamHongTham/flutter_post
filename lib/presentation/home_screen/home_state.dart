part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  final HomeStatus status;
  final List<HomeModel> homeModel;
  final bool hasReachedMax;
  final List<HomeModel> searchQuery; //search

  const HomeInitial({
    this.status = HomeStatus.initial,
    this.homeModel = const <HomeModel>[],
    this.hasReachedMax = false,
    this.searchQuery = const <HomeModel>[],
  });

  HomeInitial copyWith({
    HomeStatus? status,
    List<HomeModel>? homeModel,
    bool? hasReachedMax,
    List<HomeModel>? searchQuery,
  }) {
    return HomeInitial(
        status: status ?? this.status,
        homeModel: homeModel ?? this.homeModel,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        searchQuery: searchQuery ?? this.searchQuery);
  }

  @override
  String toString() {
    return '''HomeModelState { status: $status, hasReachedMax: $hasReachedMax, HomeModels: ${homeModel.length}, searchQuery: ${homeModel.length}''';
  }

  @override
  List<Object> get props => [status, homeModel, hasReachedMax, searchQuery];
}
