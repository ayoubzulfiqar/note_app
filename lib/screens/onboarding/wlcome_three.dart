import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../authentication/login/main_login.dart';

import '../../authentication/signup/main_signup.dart';

class WelcomeThree extends StatefulWidget {
  const WelcomeThree({Key? key}) : super(key: key);

  @override
  _WelcomeThreeState createState() => _WelcomeThreeState();
}

class _WelcomeThreeState extends State<WelcomeThree> {
  Widget _text() {
    return Align(
      alignment: Alignment.topLeft,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 150.h),
            child: Text(
              'Welcome!',
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 190.h),
            child: Text(
              'Plan, record and manage projects on any\ndevice - even offline.',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buttons() {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 130.w),
            elevation: 0,
            side: BorderSide(color: const Color(0xFF7C37FA), width: 1.w),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SigninPage(),
              ),
            );
          },
          child: Text(
            'Sign In',
            style: TextStyle(color: const Color(0xFF7C37FA), fontSize: 20.sp),
          ),
        ),
        SizedBox(height: 15.h),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            primary: const Color(0xFF7C37FA),
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 130.w),
            elevation: 0,
            side: BorderSide(color: const Color(0xFF7C37FA), width: 1.w),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
            );
          },
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
        ),
      ],
    );
  }

  Widget _image() {
    return const Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image(
          image: AssetImage('images/wel3.png'),
        ),
      ),
    );
  }

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
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            _text(),
            SizedBox(height: 40.h),
            _buttons(),
            _image(),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
