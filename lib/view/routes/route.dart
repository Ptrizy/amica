import 'package:amica/view/routes/route_path.dart';
import 'package:amica/view/screens/home_screen.dart';
import 'package:amica/view/screens/login_screen.dart';
import 'package:amica/view/screens/onboarding_screen.dart';
import 'package:amica/view/screens/pet_desc_screen.dart';
import 'package:amica/view/screens/register_screen.dart';
import 'package:amica/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> amicaRoutes = {
  RoutePath.initialRoute: (context) => const SplashScreen(),
  RoutePath.onboardingScreen: (context) => const OnboardingScreen(),
  RoutePath.loginScreen: (context) => const LoginScreen(),
  RoutePath.registerScreen: (context) => const RegisterScreen(),
  RoutePath.homeScreen: (context) => const HomeScreen(),
  RoutePath.petDescScreen: (context) => const PetDescScreen(),
};
