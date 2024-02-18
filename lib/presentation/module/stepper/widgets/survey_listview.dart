import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SurveyListView extends StatelessWidget {
  SurveyListView({super.key});

  final answerType = <String>["Instagram", "Twitter", "Teman", "Lainnya"];
  final ValueNotifier<int?> _groupValue = ValueNotifier<int?>(null);
  // final int? valuePicked;

  @override
  Widget build(BuildContext context) {
    // _groupValue.value = valuePicked;
    return ValueListenableBuilder(
      valueListenable: _groupValue,
      builder: (context, value, child) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: answerType.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: (index == _groupValue.value)
                  ? Border.all(color: Colors.deepPurple, width: 1.8)
                  : null,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              child: Row(
                children: [
                  Radio<int>(
                    value: index,
                    groupValue: value,
                    onChanged: (int? value) {
                      print("picked $value");
                      _groupValue.value = value;
                    },
                  ),
                  (index == answerType.length - 1)
                      ? Expanded(
                          child: TextFormField(
                            readOnly: true,
                            style: TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: 'Isi sendiri',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      : Text(answerType[index]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
