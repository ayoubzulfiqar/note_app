import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home/note_page.dart';

class PopDialog extends StatelessWidget {
  const PopDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WriteNote(),
                ),
              );
            },
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0.r),
              ), //this right here
              child: SizedBox(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ImageIcon(
                        AssetImage(
                          'images/Leaf.png',
                        ),
                        size: 40,
                        color: Color(0xFF7C37FA),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Start Writting',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF7C37FA),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(height: 20.h),
          Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0.r),
            ), //this right here
            child: SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ImageIcon(
                        AssetImage(
                          'images/file.png',
                        ),
                        size: 40,
                        color: Colors.yellow),
                    SizedBox(height: 10.h),
                    Text(
                      'Choose a template',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
