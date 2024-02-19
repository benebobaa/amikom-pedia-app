import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 40.w,
            height: 46.h,
            child: Center(
              child: TextFormField(
                autofocus: true,
                onSaved: (pin1) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                  if (value.isEmpty) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                keyboardType: TextInputType.number,
                maxLength: 1,
                decoration: InputDecoration(
                  counterText: "",
                  fillColor: Colors.grey[100],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // textAlign: TextAlign.center,
                // style: TextStyle(
                //   fontSize: 18.sp,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
            ),
          ),
          SizedBox(
            width: 40.w,
            height: 46.h,
            child: TextFormField(
              autofocus: true,
              onSaved: (pin2) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                counterText: "",
                fillColor: Colors.grey[100],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 40.w,
            height: 46.h,
            child: TextFormField(
              autofocus: true,
              onSaved: (pin3) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                counterText: "",
                fillColor: Colors.grey[100],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 40.w,
            height: 46.h,
            child: TextFormField(
              autofocus: true,
              onSaved: (pin4) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                counterText: "",
                fillColor: Colors.grey[100],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 40.w,
            height: 46.h,
            child: TextFormField(
              autofocus: true,
              onSaved: (pin5) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                counterText: "",
                fillColor: Colors.grey[100],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 40.w,
            height: 46.h,
            child: TextFormField(
              autofocus: true,
              onSaved: (pin6) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                counterText: "",
                fillColor: Colors.grey[100],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // SizedBox(
          //   width: 40.w,
          //   height: 46.h,
          //   child: TextFormField(
          //     autofocus: true,
          //     onSaved: (pin1) {},
          //     onChanged: (value) {
          //       if (value.length == 1) {
          //         FocusScope.of(context).nextFocus();
          //       }
          //       if (value.length == 0) {
          //         FocusScope.of(context).previousFocus();
          //       }
          //     },
          //     keyboardType: TextInputType.number,
          //     maxLength: 1,
          //     decoration: InputDecoration(
          //       counterText: "",
          //       fillColor: Colors.grey[100],
          //       filled: true,
          //       enabledBorder: OutlineInputBorder(
          //         borderSide: BorderSide(color: Colors.transparent),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderSide: BorderSide(color: Colors.transparent),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //     ),
          //     textAlign: TextAlign.center,
          //   ),
          // )
        ],
      ),
    );
  }
}
