import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post/core/routering/router_path.dart';
import 'package:post/core/styles/appColors.dart';
import 'package:post/core/styles/appPicture.dart';
import 'package:post/presentation/splash_screen/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        GoRouter.of(context).go(Routers.onboarding);
      },
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Center(
          child: Apppicture.sgvSplash,
        ),
      ),
    );
  }
}
