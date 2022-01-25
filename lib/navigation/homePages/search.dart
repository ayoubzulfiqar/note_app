import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/home_page.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _searchBar() {
      return Padding(
        padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
        child: TextFormField(
          expands: false,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            border: InputBorder.none,
            constraints: BoxConstraints(maxHeight: 80.h),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: 'Seach note',
            hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite.w, 70.h),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF0F0A39),
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
          centerTitle: true,
          toolbarHeight: 80.h,
          title: Text(
            'Search notes',
            style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: _searchBar(),
      ),
    );
  }
}
