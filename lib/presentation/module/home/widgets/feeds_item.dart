import 'package:amikompedia_app/core/constants/media_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedsItem extends StatelessWidget {
  const FeedsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: CircleAvatar(
            radius: 30.r,
            backgroundImage: AssetImage(MediaRes.otpPageImagePng),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Neira Skti",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "5 Menit",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 16.w),
                    SizedBox(
                      width: 20.w,
                      child: Image.asset(
                        MediaRes.icOption,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                    "Wah hari ini sangat menyenangkan sekali! Aku bisa ketemu sama temen-temenku si Bene, Galih, Hanif, Kholis dan masih banyak lagi!"),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    SizedBox(
                      width: 16.w,
                      child: Image.asset(
                        MediaRes.icFavorite,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text("20"),
                    SizedBox(width: 18.w),
                    SizedBox(
                      width: 16.w,
                      child: Image.asset(
                        MediaRes.icSms,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text("5"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
