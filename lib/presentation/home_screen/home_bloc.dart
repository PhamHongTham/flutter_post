import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

import '../../domain/repositories/homeRepository.dart';
import '../../common/constants/homeStateManager.dart';
import '../../common/enums/homeStatus.dart';
import '../../common/services/apiClient.dart';
import '../../common/services/homeServices.dart';
import '../../data/model/home_model/home_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  final HomeStateManager stateManager;

  HomeBloc({required Client httpClient})
      : homeRepository = HomeRepository(
          homeService:
              HomeService(apiClient: ApiClient(httpClient: httpClient)),
        ),
        stateManager = HomeStateManager(),
        super(const HomeInitial()) {
    on<HomeFetched>(_onFetched);
    on<HomeSearch>(_onSearch);
  }

  Future<void> _onFetched(HomeFetched event, Emitter emit) async {
    if (state is HomeInitial) {
      final currentState = state as HomeInitial;
      if (currentState.hasReachedMax) return;

      try {
        final homeModel = await homeRepository.fetchHomes(
          startIndex: currentState.homeModel.length,
        );

        emit(stateManager.handleFetched(currentState, homeModel));
      } catch (_) {
        emit(stateManager.handleFailure(currentState));
      }
    }
  }

  Future<void> _onSearch(HomeSearch event, Emitter emit) async {
    final currentState = state;
    if (currentState is HomeInitial) {
      try {
        emit(currentState.copyWith(
          status: HomeStatus.searching,
        ));

        final filteredHomes = homeRepository.filterHomes(
          currentState.homeModel,
          event.query,
        );

        emit(stateManager.handleSearch(currentState, filteredHomes));
      } catch (_) {
        emit(stateManager.handleFailure(currentState));
      }
    }
  }
}
