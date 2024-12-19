import 'package:amica/view/provider/auth_provider.dart';
import 'package:amica/view/routes/route_path.dart';
import 'package:amica/view/styles/color_styles.dart';
import 'package:amica/view/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

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

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Text(
                    'Buat Akun',
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
                        'Username',
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
                    controller: usernameController,
                    type: CustomTextFieldType.inputAndIcon,
                    hintText: 'Username Anda',
                    suffixIcon: 'assets/person.svg',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Nomor Telepon',
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
                    controller: phoneNumberController,
                    type: CustomTextFieldType.inputAndIcon,
                    hintText: 'Nomor Telepon Anda',
                    suffixIcon: 'assets/phone.svg',
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
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text: 'Dengan mendaftar, Anda menyetujui ',
                            style: GoogleFonts.dynaPuff(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorStyles.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Syarat',
                                style: GoogleFonts.dynaPuff(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorStyles.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' dan ',
                                style: GoogleFonts.dynaPuff(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorStyles.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Ketentuan',
                                style: GoogleFonts.dynaPuff(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorStyles.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' yang berlaku.',
                                style: GoogleFonts.dynaPuff(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorStyles.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ElevatedButton(
                    onPressed: isChecked
                        ? () async {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty ||
                                usernameController.text.isEmpty ||
                                phoneNumberController.text.isEmpty) {
                              return;
                            }

                            final success =
                                await context.read<AuthProvider>().registerUser(
                                      email: emailController.text.trim(),
                                      password: passwordController.text,
                                      username: usernameController.text.trim(),
                                      phoneNumber:
                                          phoneNumberController.text.trim(),
                                    );

                            if (success && mounted) {
                              Navigator.pushReplacementNamed(
                                  context, RoutePath.loginScreen);
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorStyles.secondary,
                      fixedSize: Size(345.w, 48.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Text(
                      'Daftar',
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
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, RoutePath.loginScreen),
                      child: RichText(
                        text: TextSpan(
                            text: 'Sudah punya akun? ',
                            style: GoogleFonts.dynaPuff(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorStyles.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Masuk',
                                style: GoogleFonts.dynaPuff(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorStyles.white,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
