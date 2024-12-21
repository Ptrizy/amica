import 'package:amica/view/provider/auth_provider.dart';
import 'package:amica/view/routes/route_path.dart';
import 'package:amica/view/styles/color_styles.dart';
import 'package:amica/view/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.primary,
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          if (authProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    SvgPicture.asset(
                      'assets/splash_logo.svg',
                      width: 172.w,
                      height: 172.h,
                    ),
                    SizedBox(
                      height: 42.h,
                    ),
                    Text(
                      'Welcome Pet Lovers!',
                      style: GoogleFonts.dynaPuff(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorStyles.black,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Masuk untuk Melanjutkan Perjalananmu',
                      style: GoogleFonts.dynaPuff(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorStyles.black,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: GoogleFonts.dynaPuff(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextField(
                      controller: emailController,
                      type: CustomTextFieldType.inputAndIcon,
                      hintText: 'Email Anda',
                      suffixIcon: 'assets/mail.svg',
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: GoogleFonts.dynaPuff(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      type: CustomTextFieldType.inputPassword,
                      obscure: true,
                      hintText: 'Password Anda',
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                          activeColor: ColorStyles.secondary,
                        ),
                        Text(
                          'Ingatkan Saya',
                          style: GoogleFonts.dynaPuff(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.black,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Lupa password?',
                          style: GoogleFonts.dynaPuff(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    if (authProvider.error != null)
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Text(
                          authProvider.error!,
                          style: GoogleFonts.dynaPuff(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ElevatedButton(
                      onPressed: () async {
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          return;
                        }

                        final success =
                            await context.read<AuthProvider>().loginUser(
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                );

                        if (success && mounted) {
                          Navigator.pushReplacementNamed(
                              context, RoutePath.homeScreen);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorStyles.secondary,
                        fixedSize: Size(345.w, 48.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: Text(
                        'Masuk',
                        style: GoogleFonts.dynaPuff(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorStyles.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, RoutePath.registerScreen),
                      child: RichText(
                        text: TextSpan(
                            text: 'Belum punya akun? ',
                            style: GoogleFonts.dynaPuff(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorStyles.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Daftar',
                                style: GoogleFonts.dynaPuff(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorStyles.white,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
