import 'package:amica/model/pet_model.dart';
import 'package:amica/view/provider/pet_provider.dart';
import 'package:amica/view/routes/route_path.dart';
import 'package:amica/view/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.h,
            right: 24.h,
          ),
          child: Consumer<PetProvider>(
            builder: (context, petProvider, child) {
              if (petProvider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/small_logo.svg'),
                        Image.asset(
                          'assets/placeholder_profile.png',
                          width: 50.w,
                          height: 51.h,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Halo Pet Lover!',
                        style: GoogleFonts.dynaPuff(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: ColorStyles.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About amica',
                            style: GoogleFonts.dynaPuff(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.neutral600,
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'amica adalah aplikasi pelacak hewan peliharaan yang dapat membantu Anda mencari hingga menemukan hewan kesayangan Anda dengan mudah.',
                            style: GoogleFonts.dynaPuff(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorStyles.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Image.asset(
                        'assets/pl_amica.png',
                        fit: BoxFit.fill,
                        width: 349.w,
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        mainAxisExtent: 283.h,
                      ),
                      itemCount: petProvider.pets.length,
                      itemBuilder: (context, index) {
                        final pet = petProvider.pets[index];
                        return PetCard(pet: pet);
                      },
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final Pet pet;

  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.network(
                  pet.image,
                  width: double.infinity,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                left: 8,
                child: SvgPicture.asset(
                  pet.isMale ? 'assets/male.svg' : 'assets/female.svg',
                  width: 20,
                  height: 20,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCE7A7),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text(
                    pet.registered,
                    style: GoogleFonts.dynaPuff(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorStyles.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama',
                  style: GoogleFonts.dynaPuff(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorStyles.black,
                  ),
                ),
                Text(
                  pet.nama,
                  style: GoogleFonts.dynaPuff(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorStyles.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Jenis Hewan',
                  style: GoogleFonts.dynaPuff(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorStyles.black,
                  ),
                ),
                Text(
                  pet.breed,
                  style: GoogleFonts.dynaPuff(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorStyles.black,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              context.read<PetProvider>().setSelectedPet(pet);

              await Future.delayed(const Duration(milliseconds: 600));
              if (context.mounted) {
                Navigator.pushNamed(context, RoutePath.petDescScreen);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorStyles.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
              minimumSize: Size(double.infinity, 36.h),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/take_hand.svg',
                  width: 16.w,
                  height: 16.h,
                ),
                SizedBox(width: 4.w),
                Text(
                  'Ambil',
                  style: GoogleFonts.dynaPuff(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorStyles.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
