// ignore_for_file: file_names

import '../../data/model/home_model/home_model.dart';
import '../../presentation/home_screen/home_bloc.dart';
import '../enums/homeStatus.dart';

class HomeStateManager {
  HomeState handleFetched(HomeInitial currentState, List<HomeModel> homeModel) {
    if (homeModel.isEmpty) {
      return currentState.copyWith(hasReachedMax: true);
    }

    return currentState.copyWith(
      status: HomeStatus.success,
      homeModel: [...currentState.homeModel, ...homeModel],
    );
  }

  HomeState handleSearch(
      HomeInitial currentState, List<HomeModel> filteredHomes) {
    return currentState.copyWith(
      status: HomeStatus.success,
      homeModel: filteredHomes,
    );
  }

  HomeState handleFailure(HomeInitial currentState) {
    return currentState.copyWith(status: HomeStatus.failure);
  }
}
