import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeOne extends StatefulWidget {
  const WelcomeOne({Key? key}) : super(key: key);

  @override
  _WelcomeOneState createState() => _WelcomeOneState();
}

class _WelcomeOneState extends State<WelcomeOne> {
  Widget _container() {
    return Container(
      // alignment: Alignment.topCenter,
      width: double.maxFinite,
      color: Colors.white,
      height: 100.h,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h, left: 280.w),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF7C37FA),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _text() {
    return Align(
      alignment: Alignment.topLeft,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 70.h),
            child: Text(
              'Welcome!',
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 110.h),
            child: Text(
              'Focus on what matters most\nManage everything, from big projects to\npersonal moments.',
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

  Widget _image() {
    return const Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image(
          image: AssetImage('images/wel.png'),
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
            _container(),
            // SizedBox(
            //   height: 20.h,
            // ),
            _text(),
            _image(),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
