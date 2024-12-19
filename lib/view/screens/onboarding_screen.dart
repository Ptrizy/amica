import 'package:amica/view/routes/route_path.dart';
import 'package:amica/view/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.primary,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 340.h,
              bottom: 266.h,
            ),
            child: Text(
              'jejak mereka mungkin hilang, tapi harapan untuk menemukan selalu ada di sini...',
              style: GoogleFonts.dynaPuff(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorStyles.black),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, RoutePath.loginScreen),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorStyles.white,
              fixedSize: Size(345.w, 56.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Text(
              'cari sekarang',
              style: GoogleFonts.dynaPuff(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorStyles.black),
            ),
          )
        ],
      ),
    );
  }
}
