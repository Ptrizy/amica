import 'package:amica/view/provider/pet_provider.dart';
import 'package:amica/view/routes/route_path.dart';
import 'package:amica/view/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PetDescScreen extends StatelessWidget {
  const PetDescScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PetProvider>(
      builder: (context, petProvider, child) {
        final pet = petProvider.selectedPet;
        if (pet == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      pet.image,
                      width: double.infinity,
                      height: 300.h,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 48.h,
                      left: 24.w,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: const Center(
                            child: Icon(Icons.arrow_back_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      Text(
                        pet.title,
                        style: GoogleFonts.dynaPuff(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorStyles.black,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        pet.description,
                        style: GoogleFonts.dynaPuff(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.neutral600,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pet Description:',
                              style: GoogleFonts.dynaPuff(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: ColorStyles.black,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            _buildDescriptionRow('Nama', pet.nama),
                            SizedBox(height: 8.h),
                            _buildDescriptionRow('Jenis', pet.breed),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                            await Future.delayed(const Duration(seconds: 3));
                            if (context.mounted) {
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(
                                  context, RoutePath.homeScreen);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7EC242),
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/take_hand.svg',
                                width: 20.w,
                                height: 20.h,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Ambil',
                                style: GoogleFonts.dynaPuff(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDescriptionRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.dynaPuff(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorStyles.neutral600,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.dynaPuff(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorStyles.black,
          ),
        ),
      ],
    );
  }
}
