import "package:amikompedia_app/core/constants/media_res.dart";
import "package:amikompedia_app/core/widgets/custom_button.dart";
import "package:amikompedia_app/presentation/module/otp/otp_success_page.dart";
import 'package:amikompedia_app/presentation/module/otp/widgets/otp_form.dart';
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  static const routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 120.h,
                child: Image.asset(
                  MediaRes.otpPageImagePng,
                  height: 100.h,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "OTP Verification",
              style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text.rich(
              TextSpan(
                text:
                    'Kami telah mengirimkan 6 digit OTP Verification ke email ',
                style: TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'muhammadreza@students.amikom.ac.id',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.sp),
            ),
            SizedBox(height: 20.h),
            OtpForm(),
            SizedBox(height: 60.h),
            CustomButton(
                title: "Verifikasi",
                onPressed: () {
                  Navigator.pushNamed(context, OtpSuccessPage.routeName);
                }),
            SizedBox(height: 20.h),
            Text.rich(
              TextSpan(
                text: 'Tidak menerima kode? ',
                style: TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Kirim Ulang OTP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple, // Customize the text color
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Daftar");
                        // Add your 'Register' logic here
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
