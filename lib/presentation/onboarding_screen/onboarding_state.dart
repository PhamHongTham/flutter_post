part of 'onboarding_bloc.dart';

class OnboardingStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnboardingInitial extends OnboardingStates {
  final int pageIndex;

  OnboardingInitial({this.pageIndex = 0});

  @override
  List<Object?> get props => [pageIndex];
}
