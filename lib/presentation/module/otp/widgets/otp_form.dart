import "dart:async";

import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:pin_code_fields/pin_code_fields.dart";

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: PinCodeTextField(
        appContext: context,
        pastedTextStyle: TextStyle(
          color: Colors.green.shade600,
          fontWeight: FontWeight.bold,
        ),

        length: 6,
        obscureText: false,
        obscuringCharacter: '*',
        animationType: AnimationType.fade,

        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50.h,
          fieldWidth: 45.w,
          activeFillColor: Colors.grey[200],
          activeColor: Colors.transparent,
          inactiveColor: Colors.transparent,
          inactiveFillColor: Colors.grey[200],
          selectedFillColor: Colors.grey[200],
          selectedColor: Colors.deepPurple,
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        textStyle: const TextStyle(fontSize: 20, height: 1.6),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        errorAnimationController: errorController,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        boxShadows: [
          const BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        onCompleted: (v) {
          print("Completed");
        },
        // onTap: () {
        //   print("Pressed");
        // },
        onChanged: (value) {
          print(value);
          setState(() {
            currentText = value;
          });
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}
