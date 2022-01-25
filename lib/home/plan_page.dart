import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_page.dart';

class ChoosePlan extends StatelessWidget {
  const ChoosePlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _basicPlan() {
      return Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 60, right: 60),
                child: Container(
                  height: 450.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5.0.r,
                          blurRadius: 7.0.r,
                        )
                      ]),
                ),
              ),
              Image(
                image: const AssetImage('images/basic.png'),
                width: 100.w,
                height: 100.h,
              ),
              Positioned(
                top: 100.h,
                child: Text(
                  'Basic',
                  style:
                      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                left: 80,
                top: 150.h,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: const AssetImage('images/tick.png'),
                          height: 15.h,
                          width: 15.w,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Sync on 2 devices',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Image(
                          image: const AssetImage('images/tick.png'),
                          height: 15.h,
                          width: 15.w,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Access notebook in offline\nmode',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Image(
                          image: const AssetImage('images/tick.png'),
                          height: 15.h,
                          width: 15.w,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Search in documents and\nattachments',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    // Row(
                    //   children: [
                    //     Image(
                    //       image: AssetImage('images/tick.png'),
                    //       height: 15.h,
                    //       width: 15.w,
                    //     ),
                    //     SizedBox(width: 10.w),
                    //     Text(
                    //       'Scan and digitize business\ncards',
                    //       style: TextStyle(fontSize: 18.sp),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 20.h),
                    Row(
                      children: [
                        Image(
                          image: const AssetImage('images/tick.png'),
                          height: 15.h,
                          width: 15.w,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Annotate PDF files',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 80.w, top: 70.h),
                      child: Text(
                        'Free',
                        style: TextStyle(
                            fontSize: 27.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: const Color(0xFF7C37FA),
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 80.w),
                          elevation: 0,
                          side: BorderSide(
                              color: const Color(0xFF7C37FA), width: 1.w),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Select',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget _premiumPlan() {
      return Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 60, right: 60),
                child: Container(
                  height: 450.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(10.0.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5.0.r,
                        blurRadius: 7.0.r,
                      )
                    ],
                  ),
                ),
              ),
              Image(
                image: const AssetImage('images/premium.png'),
                width: 100.w,
                height: 100.h,
              ),
              Positioned(
                top: 100.h,
                child: Text(
                  'Premium',
                  style:
                      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                left: 80,
                top: 150.h,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: const AssetImage('images/tick.png'),
                          height: 15.h,
                          width: 15.w,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Sync on multiple devices',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Image(
                          image: const AssetImage('images/tick.png'),
                          height: 15.h,
                          width: 15.w,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Access notebook in offline\nmode',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Image(
                          image: const AssetImage('images/tick.png'),
                          height: 15.h,
                          width: 15.w,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Search in documents and\nattachments',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Image(
                          image: const AssetImage('images/tick.png'),
                          height: 15.h,
                          width: 15.w,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Scan and digitize business\ncards',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Image(
                          image: const AssetImage('images/tick.png'),
                          height: 15.h,
                          width: 15.w,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Annotate PDF files',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w, top: 30.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            r'$6,99,',
                            style: TextStyle(
                                fontSize: 27.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' Per month',
                            style: TextStyle(fontSize: 20.sp),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: const Color(0xFF7C37FA),
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 80.w),
                          elevation: 0,
                          side: BorderSide(
                              color: const Color(0xFF7C37FA), width: 1.w),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Select',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 80.h),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          toolbarHeight: 90,
          centerTitle: true,
          title: Text(
            "Choose you plan",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
                color: Colors.black),
          ),
          leading: IconButton(
            icon: const ImageIcon(
              AssetImage(
                'images/Path.png',
              ),
              color: Colors.black,
              size: 18,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          color: Colors.white,
          // width: double.maxFinite.w,
          // height: double.maxFinite.h,
          child: Row(
            children: [
              _basicPlan(),
              _premiumPlan(),
            ],
          ),
        ),
      ),
    );
  }
}
