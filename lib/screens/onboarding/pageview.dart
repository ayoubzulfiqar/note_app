import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'welcome_one.dart';
import 'welcome_two.dart';
import 'wlcome_three.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViews extends StatefulWidget {
  const PageViews({Key? key}) : super(key: key);

  @override
  _PageViewsState createState() => _PageViewsState();
}

class _PageViewsState extends State<PageViews> {
  final PageController pageController = PageController(initialPage: 0);
  final List pages = [
    const WelcomeOne(),
    const WelcomeTwo(),
    const WelcomeThree(),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (page) {},
            itemCount: pages.length,
            itemBuilder: (context, index) => pages[index],
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.h, left: 20),
            child: SmoothPageIndicator(
              textDirection: TextDirection.ltr,
              controller: pageController,
              count: pages.length,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: const Color(0xFF7C37FA),
                  borderRadius: BorderRadius.circular(24),
                  dotBorder: DotBorder(
                    padding: 4,
                    width: 2.w,
                    color: const Color(0xFF7C37FA),
                  ),
                ),
                dotDecoration: DotDecoration(
                  width: 6,
                  height: 6,
                  color: Colors.grey.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                  verticalOffset: 0,
                ),
                spacing: 6.0,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
