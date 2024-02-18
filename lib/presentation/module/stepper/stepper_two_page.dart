import 'package:amikompedia_app/core/constants/media_res.dart';
import 'package:amikompedia_app/core/widgets/custom_button.dart';
import 'package:amikompedia_app/core/widgets/custom_text_form_field.dart';
import 'package:amikompedia_app/presentation/module/stepper/stepper_three_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepperTwoPage extends StatefulWidget {
  StepperTwoPage({super.key});

  static const routeName = "/stepper-two";

  @override
  State<StepperTwoPage> createState() => _StepperTwoPageState();
}

class _StepperTwoPageState extends State<StepperTwoPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          controller: _scrollController,
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
                ],
              ),
              SizedBox(height: 18.h),
              Text(
                "Lengkapi",
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "Profilemu",
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 36.h),
              Text.rich(
                TextSpan(
                  text: "Header ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "(optional)",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Ukuran yang direkomendasikan 1500 x 500 px (3:1)",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16.h),
              Stack(
                children: [
                  Container(
                    height: 110.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Upload Header",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: SizedBox(
                        height: 16.h,
                        width: 16.w,
                        child: Image.asset(MediaRes.icPen),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                "Photo Profile",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                  height: 110.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[400],
                        child: Icon(
                          Icons.person_sharp,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        height: 40.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Upload Photo",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              CustomTextFormField(
                  title: "Nama", isPassword: false, hintText: "Muhammad Reza"),
              SizedBox(height: 12.h),
              CustomTextFormField(
                  title: "Bio",
                  isPassword: false,
                  hintText: "Masukkan bio kamu",
                  isMultiline: true),
              SizedBox(height: 18.h),
              CustomButton(
                title: "Selanjutnya",
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    StepperThreePage.routeName,
                  ).then((value) {
                    _scrollController.animateTo(
                      _scrollController.position.minScrollExtent,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.ease,
                    );
                  });
                },
              ),
              SizedBox(height: 18.h),
            ],
          ),
        ),
      ),
    );
  }
}
