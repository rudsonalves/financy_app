import 'package:financy_app/features/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

import 'common/constants/app_routes.dart';
import './common/themes/default_theme.dart';
import 'features/sign_up/sign_up_page.dart';
import './features/onboarding/onboarding_page.dart';
import './features/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      // theme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: const Color.fromARGB(255, 23, 96, 156),
      //     brightness: Brightness.light,
      //     primary: Colors.amber,
      //     secondary: Colors.yellowAccent,
      //   ),
      // ),
      initialRoute: AppRoute.splachPage,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoute.splachPage: (context) => const SplashPage(),
        AppRoute.initialPage: (context) => const OnboardingPage(),
        AppRoute.signUpPage: (context) => const SignUpPage(),
        AppRoute.signInPage: (context) => const SignInPage(),
      },
    );
  }
}
