import 'package:amikompedia_app/core/constants/media_res.dart';
import 'package:amikompedia_app/core/widgets/custom_button.dart';
import 'package:amikompedia_app/core/widgets/custom_text_form_field.dart';
import 'package:amikompedia_app/presentation/pages/otp_page.dart';
import 'package:amikompedia_app/presentation/pages/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const routeName = "/";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Container(
              height: 18.h,
              child: Image.asset(
                MediaRes.icLogo,
                height: 100.h,
              ),
            ),
            SizedBox(height: 20.h),
            Divider(),
            SizedBox(height: 25.h),
            Text(
              "Sign In",
              style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Text(
              maxLines: 2,
              textAlign: TextAlign.center,
              "Silahkan masukkan datamu dibawah ini dengan benar untuk membuat akun.",
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email tidak boleh kosong";
                  }
                  return null;
                },
                controller: _emailController,
                title: "Email Amikom",
                isPassword: false,
                hintText: "amikompedia@students.amikom.ac.id"),
            SizedBox(height: 12.h),
            CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
                controller: _passwordController,
                isObscure: true,
                title: "Password",
                isPassword: true,
                hintText: "Password"),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password?"),
                )
              ],
            ),
            SizedBox(height: 20.h),
            CustomButton(
              title: "Login",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("Email: ${_emailController.text}");
                  Navigator.pushNamed(context, OtpPage.routeName);
                }
              },
            ),
            SizedBox(height: 16.h),
            Text.rich(
              TextSpan(
                text: 'Belum punya akun? ',
                style: TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Daftar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple, // Customize the text color
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Daftar");
                        Navigator.pushNamed(context, RegisterPage.routeName);
                        // Add your 'Register' logic here
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
