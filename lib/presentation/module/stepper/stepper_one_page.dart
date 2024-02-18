import 'package:amikompedia_app/core/widgets/custom_button.dart';
import 'package:amikompedia_app/core/widgets/custom_text_form_field.dart';
import 'package:amikompedia_app/presentation/module/stepper/stepper_two_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepperOnePage extends StatelessWidget {
  const StepperOnePage({super.key});

  static const routeName = "/stepper-one";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 2.2,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: Divider(),
                ),
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            Text(
              "Tentukan Username",
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 60.h),
            CustomTextFormField(
                title: "Username", isPassword: false, hintText: "@beneboba"),
            SizedBox(height: 18.h),
            CustomButton(
              title: "Selanjutnya",
              onPressed: () {
                Navigator.pushNamed(context, StepperTwoPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
