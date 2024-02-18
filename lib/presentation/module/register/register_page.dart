import 'package:amikompedia_app/core/constants/media_res.dart';
import 'package:amikompedia_app/core/widgets/custom_button.dart';
import 'package:amikompedia_app/core/widgets/custom_text_form_field.dart';
import 'package:amikompedia_app/presentation/module/login/login_page.dart';
import 'package:amikompedia_app/presentation/module/otp/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  static const routeName = "/register";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
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
                SizedBox(height: 8.h),
                Text(
                  "Getting Started",
                  style:
                      TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  "Let's create your account here",
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                    title: "Nama Lengkap",
                    isPassword: false,
                    hintText: "Amikom Pedia"),
                SizedBox(height: 12.h),
                CustomTextFormField(
                    title: "Email Amikom",
                    isPassword: false,
                    hintText: "amikompedia@students.amikom.ac.id"),
                SizedBox(height: 12.h),
                CustomTextFormField(
                    title: "NIM", isPassword: false, hintText: "20.11.XXXX"),
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
                SizedBox(height: 12.h),
                CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty &&
                          _passwordController.text.isNotEmpty) {
                        return "Password tidak boleh kosong";
                      }
                      if (value.isNotEmpty &&
                          value != _passwordController.text) {
                        return "Password tidak sama";
                      }
                      return null;
                    },
                    controller: _confirmPasswordController,
                    title: "Konfirmasi Password",
                    isObscure: true,
                    isPassword: true,
                    hintText: "Password"),
                SizedBox(height: 20.h),
                CustomButton(
                  title: "Buat Akun",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Email: ${_passwordController.text}");
                      Navigator.pushNamed(context, LoginPage.routeName);
                    }
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, OtpPage.routeName);
      }),
    );
  }
}
