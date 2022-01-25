import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pageview.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const PageViews(),
      ),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Image(
              alignment: Alignment.topLeft,
              image: AssetImage('images/top.png'),
            ),
          ),
          Center(
            child: Image(
              width: 200.w,
              height: 200.h,
              image: const AssetImage('images/midlogo.png'),
            ),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Image(
              image: AssetImage('images/bottom.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 530.h, left: 180.w),
            child: const CircularProgressIndicator(
              color: Colors.blue,
              backgroundColor: Color(0xFF7C37FA),
              strokeWidth: 3,
            ),
          ),
        ],
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
    return initScreen(context);
  }
}
