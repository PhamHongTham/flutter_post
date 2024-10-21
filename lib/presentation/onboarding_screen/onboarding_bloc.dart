import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingStates> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvents>(_pageIndex);
  }

  void _pageIndex(OnboardingEvents event, Emitter emit) {
    final updatedPageIndex = event.pageIndex;
    emit(OnboardingInitial(pageIndex: updatedPageIndex));
  }
}
