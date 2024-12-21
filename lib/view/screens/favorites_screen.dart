import 'package:amica/view/provider/pet_provider.dart';
import 'package:amica/view/screens/home_screen.dart';
import 'package:amica/view/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.arrow_back_ios_rounded),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    'Favorit Saya',
                    style: GoogleFonts.dynaPuff(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorStyles.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              // Grid favorites
              Expanded(
                child: Consumer<PetProvider>(
                  builder: (context, petProvider, child) {
                    final favoritePets = petProvider.pets
                        .where((pet) => pet.isFavorite)
                        .toList();

                    if (favoritePets.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 48.sp,
                              color: ColorStyles.neutral600,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Belum ada favorit',
                              style: GoogleFonts.dynaPuff(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.neutral600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        mainAxisExtent: 283.h,
                      ),
                      itemCount: favoritePets.length,
                      itemBuilder: (context, index) {
                        final pet = favoritePets[index];
                        return PetCard(pet: pet);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
