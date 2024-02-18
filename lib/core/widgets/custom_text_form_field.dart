import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {super.key,
      this.validator,
      this.isObscure = false,
      this.isMultiline = false,
      required this.isPassword,
      this.hintText,
      this.controller,
      required this.title});

  String? Function(String?)? validator;
  bool? isObscure;
  final String title;
  final bool isPassword;
  final String? hintText;
  final TextEditingController? controller;
  bool? isMultiline;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          maxLines: widget.isMultiline! ? 3 : 1,
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.isObscure ?? false,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      widget.isObscure = !widget.isObscure!;
                      setState(() {});
                    },
                    icon: Icon(
                      widget.isObscure ?? false
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ))
                : null,
            hintText: widget.hintText,
            fillColor: Colors.grey[100],
            filled: true,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
