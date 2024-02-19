import 'package:amikompedia_app/core/widgets/custom_button.dart';
import 'package:amikompedia_app/core/widgets/custom_text_form_field.dart';
import 'package:amikompedia_app/presentation/module/stepper/widgets/survey_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepperThreePage extends StatelessWidget {
  const StepperThreePage({
    super.key,
  });

  static const routeName = "/stepper-three";
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
                const Expanded(
                  child: Divider(
                    thickness: 2.2,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(
                  width: 14.w,
                ),
                const Expanded(
                  child: Divider(
                    thickness: 2.2,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(
                  width: 14.w,
                ),
                const Expanded(
                  child: Divider(
                    thickness: 2.2,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            Text(
              "Survei",
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 22.h),
            const Text(
              "Tahu dari mana Amikom Pedia?",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SurveyListView(),
            SizedBox(height: 22.h),
            CustomTextFormField(
              hintText: "Deskripsi",
              isPassword: false,
              title:
                  "Apa first impression kamu mendengar aplikasi AmikomPedia?",
              isMultiline: true,
            ),
            SizedBox(height: 18.h),
            CustomButton(
              title: "Kirim",
              onPressed: () {},
            ),
            SizedBox(height: 18.h),
          ],
        ),
      ),
    );
  }
}
