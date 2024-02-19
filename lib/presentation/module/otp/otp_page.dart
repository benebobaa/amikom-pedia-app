import "package:amikompedia_app/core/constants/media_res.dart";
import "package:amikompedia_app/core/widgets/custom_button.dart";
import "package:amikompedia_app/presentation/module/otp/otp_success_page.dart";
import 'package:amikompedia_app/presentation/module/otp/widgets/otp_form.dart';
import "package:amikompedia_app/presentation/module/otp/widgets/otp_form_lib.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:overlay_kit/overlay_kit.dart";

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
              child: SizedBox(
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
              const TextSpan(
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
            const OtpForm(),
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
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Kirim Ulang OTP',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple, // Customize the text color
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        OverlayLoadingProgress.start(
                            widget: Container(
                          height: 70.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:
                              const Center(child: CircularProgressIndicator()),
                        ));
                        await Future.delayed(const Duration(seconds: 3));
                        OverlayLoadingProgress.stop();

                        Navigator.pushNamed(
                            context, PinCodeVerificationScreen.routeName);
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
