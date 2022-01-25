import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyPassword extends StatefulWidget {
  const VerifyPassword({Key? key}) : super(key: key);

  @override
  State<VerifyPassword> createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  final TextEditingController _firstField = TextEditingController();
  final TextEditingController _secondField = TextEditingController();
  final TextEditingController _thirdField = TextEditingController();
  final TextEditingController _fourthField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _text() {
      return Padding(
        padding: EdgeInsets.only(left: 20.w, top: 20.h),
        child: Text(
          'Check your email address, we have sent\nyou the code at',
          style: TextStyle(fontSize: 20.sp, color: Colors.grey),
        ),
      );
    }

    Widget _recivedCodeText() {
      return Padding(
        padding: EdgeInsets.only(left: 30.w, right: 20.w, top: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Didn't receive the code?",
              style: TextStyle(fontSize: 18.sp, color: Colors.grey),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Resend",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF7C37FA),
                    fontSize: 18.sp),
              ),
            ),
          ],
        ),
      );
    }

    Widget _timeCounter() {
      return Align(
        alignment: Alignment.centerRight,
        child: TweenAnimationBuilder<Duration>(
          duration: const Duration(minutes: 1),
          tween: Tween(begin: const Duration(minutes: 1), end: Duration.zero),
          onEnd: () {
            // print('Timer ended');
          },
          builder: (BuildContext context, Duration value, Widget? child) {
            final minutes = value.inMinutes;
            final seconds = value.inSeconds % 60;
            return Padding(
              padding: EdgeInsets.only(
                right: 30.w,
              ),
              child: Text(
                '($minutes:$seconds)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            );
          },
        ),
      );
    }

    // Widget _bottomImage() {
    //   return Stack(
    //     children: [
    //       Positioned(
    //         child: Image(
    //           alignment: Alignment.bottomCenter,
    //           image: AssetImage('images/bottom.png'),
    //         ),
    //       ),
    //     ],
    //   );
    // }

    Widget _sendButton() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          primary: const Color(0xFF7C37FA),
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 130.w),
          elevation: 0,
          side: BorderSide(color: const Color(0xFF7C37FA), width: 1.w),
        ),
        onPressed: () {},
        child: Text(
          'Send',
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      );
    }

    const _title = "Verify Code";

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 90.h,
          centerTitle: true,
          leading: IconButton(
            padding: EdgeInsets.only(left: 20.w),
            onPressed: () {
              // print('Working');
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            _title,
            style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        preferredSize: Size.fromHeight(90.h),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _text(),
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 50.h, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutputField(true, _firstField),
                  OutputField(false, _secondField),
                  OutputField(false, _thirdField),
                  OutputField(false, _fourthField)
                ],
              ),
            ),
            _recivedCodeText(),
            _timeCounter(),
            SizedBox(height: 230.h),
            _sendButton(),

            // _bottomImage(),
          ],
        ),
      ),
    );
  }
}

class OutputField extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OutputField(this.autoFocus, this.controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 30),
      child: SizedBox(
        width: 52.w,
        height: 50.h,
        // color: Colors.grey.withOpacity(0.5),
        child: TextField(
          autofocus: autoFocus,
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            counterText: '',
            hintStyle:
                const TextStyle(color: Color(0xFF7C37FA), fontSize: 20.0),
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
