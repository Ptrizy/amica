import 'package:amica/view/provider/auth_provider.dart';
import 'package:amica/view/provider/pet_provider.dart';
import 'package:amica/view/routes/route_path.dart';
import 'package:amica/view/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  Future<void> checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      final authProvider = context.read<AuthProvider>();
      final user = authProvider.currentUser;

      if (user != null) {
        await context.read<PetProvider>().loadPets();
        if (mounted) {
          Navigator.pushReplacementNamed(context, RoutePath.homeScreen);
        }
      } else {
        if (mounted) {
          Navigator.pushReplacementNamed(context, RoutePath.onboardingScreen);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.primary,
      body: Center(
        child: SvgPicture.asset(
          'assets/splash_logo.svg',
          width: 173.w,
          height: 170.h,
        ),
      ),
    );
  }
}
