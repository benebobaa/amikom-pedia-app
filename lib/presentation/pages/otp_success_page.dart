import "package:amikompedia_app/core/constants/media_res.dart";
import "package:amikompedia_app/core/widgets/custom_button.dart";
import "package:amikompedia_app/presentation/pages/login_page.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class OtpSuccessPage extends StatelessWidget {
  const OtpSuccessPage({super.key});

  static const routeName = "/otp-success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 120.h,
                child: Image.asset(
                  MediaRes.otpSuccessImagePng,
                  height: 100.h,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "OTP Berhasil",
              style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              maxLines: 2,
              textAlign: TextAlign.center,
              "Silahkan klik tombol Selanjutnya untuk pembuatan akun",
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(height: 80.h),
            CustomButton(
                title: "Selanjutnya",
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginPage.routeName, (route) => false);
                }),
          ],
        ),
      ),
    );
  }
}
