import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart';
import 'package:post/core/routering/app_router.dart';
import 'package:post/data/model/contact_model/contact_model.dart';
import 'package:post/presentation/favorite_screen/favorite_bloc.dart';

import 'presentation/contact_screen/contact_bloc.dart';
import 'presentation/home_screen/home_bloc.dart';
import 'presentation/onboarding_screen/onboarding_bloc.dart';
import 'presentation/splash_screen/splash_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());
  await Hive.openBox<Contact>('contactsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(); // Tạo instance duy nhất của AppRouter

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SplashBloc(appRouter.router)..add(SplashInitialEvent()),
        ),
        BlocProvider(
          create: (context) => OnboardingBloc(),
        ),
        BlocProvider(
          create: (context) =>
              HomeBloc(httpClient: Client())..add(HomeFetched()),
        ),
        BlocProvider(
          create: (_) => ContactBloc()..add(LoadContacts()),
        ),
        BlocProvider(create: (_) => FavoriteBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.router.routerDelegate,
        routeInformationParser: appRouter.router.routeInformationParser,
        routeInformationProvider: appRouter.router.routeInformationProvider,
      ),
    );
  }
}
