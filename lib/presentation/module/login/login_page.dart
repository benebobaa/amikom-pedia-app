import 'dart:developer';

import 'package:amikompedia_app/core/constants/media_res.dart';
import 'package:amikompedia_app/core/widgets/custom_button.dart';
import 'package:amikompedia_app/core/widgets/custom_text_form_field.dart';
import 'package:amikompedia_app/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:amikompedia_app/presentation/bloc/login_bloc/login_event.dart';
import 'package:amikompedia_app/presentation/bloc/login_bloc/login_state.dart';
import 'package:amikompedia_app/presentation/module/otp/otp_page.dart';
import 'package:amikompedia_app/presentation/module/stepper/stepper_one_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_kit/overlay_kit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const routeName = "/";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        log("state $state");
        if (state.status == LoginStatus.success) {
          OverlayLoadingProgress.stop();
          OverlayToastMessage.show(
            widget: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                "Login Berhasil, Halo ${state.loginEntity!.userEntity.username}!",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }
        if (state.status == LoginStatus.loading) {
          OverlayLoadingProgress.start(
            widget: Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
          );
        }
        if (state.status == LoginStatus.failure) {
          OverlayLoadingProgress.stop();
          OverlayToastMessage.show(
            widget: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                state.message!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      },
      child: Padding(
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
              const Divider(),
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
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, OtpPage.routeName);
                    },
                    child: const Text("Forgot Password?"),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              CustomButton(
                title: "Login",
                onPressed: () async {
                  log("email ${_emailController.text}");
                  log("password ${_passwordController.text}");
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(OnLogin(
                        email: _emailController.text,
                        password: _passwordController.text));
                  }
                },
              ),
              SizedBox(height: 16.h),
              Text.rich(
                TextSpan(
                  text: 'Belum punya akun? ',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Daftar',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple, // Customize the text color
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                              context, StepperOnePage.routeName);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
