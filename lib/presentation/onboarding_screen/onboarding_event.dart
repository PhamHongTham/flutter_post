part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class OnboardingEvents extends OnboardingEvent {
  final int pageIndex;

  const OnboardingEvents({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}
