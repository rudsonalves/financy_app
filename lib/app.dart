import 'package:flutter/material.dart';

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
      home: const SignUpPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        OnboardingPage.routeName: (context) => const OnboardingPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
      },
    );
  }
}
