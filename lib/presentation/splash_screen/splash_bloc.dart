import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GoRouter router;

  SplashBloc(this.router) : super(SplashInitial()) {
    on<SplashInitialEvent>(_onSplashInitial);
  }

  Future<void> _onSplashInitial(SplashInitialEvent event, Emitter emit) async {
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashNavigateToOnboarding());
  }
}
