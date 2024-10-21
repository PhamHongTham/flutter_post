part of 'splash_bloc.dart';

@immutable
abstract class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {}

//
class SplashNavigateToOnboarding extends SplashState {}
