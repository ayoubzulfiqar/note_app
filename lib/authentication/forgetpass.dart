import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(360, 690),
      minTextAdapt: true,
      // orientation: Orientation.portrait,
    );
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 20.w,
            top: 60.h,
            child: IconButton(
              // padding: EdgeInsets.only(left: 20.w),
              onPressed: () {
                // print('Its Working');
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 70.h),
              child: Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 140.h,
            left: 30,
            child: Row(
              children: [
                Text(
                  'Enter',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.8)),
                ),
                Text(
                  ' your email address',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF7C37FA).withOpacity(0.9),
                  ),
                ),
                Text(
                  ' to resest your',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.8)),
                ),
              ],
            ),
          ),
          Positioned(
            left: 30.w,
            top: 160.h,
            child: Text(
              'password',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(0.8)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 220.h, left: 30.w, right: 30.w),
            child: TextFormField(
              // expands: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                constraints: BoxConstraints(maxHeight: 90.h),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                hintText: 'Enter email',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
