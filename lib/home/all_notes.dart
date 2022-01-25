import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/hive_flutter.dart';
import '../data/box/box.dart';
import 'home_page.dart';
import 'note_page.dart';
import '../model/note.dart';

class AllNotes extends StatefulWidget {
  const AllNotes({Key? key}) : super(key: key);

  @override
  _AllNotesState createState() => _AllNotesState();
}

class _AllNotesState extends State<AllNotes> {
  Widget _silverAppBar() {
    return SliverAppBar(
      toolbarHeight: 70.h,
      backgroundColor: Colors.white,
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
      floating: true,
      pinned: true,
      snap: false,
      centerTitle: true,
      title: Text(
        'All Note',
        style: TextStyle(
            color: const Color(0xFF0F0A39),
            fontSize: 25.sp,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
            color: Color(0xFF0F0A39),
          ),
        ),
      ],
      bottom: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 170.w,
              height: 40.h,
              // color: Colors.grey,
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
            ),
            SizedBox(width: 5.w),
            IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                AssetImage('images/tag.png'),
                color: Colors.grey,
                size: 27,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                AssetImage('images/alerm.png'),
                color: Colors.grey,
                size: 27,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: const Image(
              image: AssetImage('images/abc.jpg'),
            ),
          ),
          Positioned(
            left: 30.w,
            top: 20.h,
            child: Text(
              'Start a free trial',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 30.w,
            top: 50.h,
            child: Text(
              'Works offline with unlimited\ndevices. Start testing today',
              style: TextStyle(
                fontSize: 18.sp,
                // fontWeight: FontWeight.bold,
                color: const Color(0xFFCBC9D9),
              ),
            ),
          ),
          Positioned(
            left: 30.w,
            top: 105.h,
            child: Text(
              'Looking for more information',
              style: TextStyle(
                fontSize: 17.sp,
                // fontWeight: FontWeight.bold,
                color: const Color(0xFF40F4F8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _noteList() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      child: Form(
        child: ValueListenableBuilder(
          valueListenable: Hive.box<Note>(HiveBoxes.note).listenable(),
          builder: (context, Box<Note> box, _) {
            if (box.values.isEmpty) {
              return const Center(
                child: Text("Note list is empty"),
              );
            }

            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                Note? res = box.getAt(index);
                return Dismissible(
                  background: Container(color: Colors.red),
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    res!.delete();
                  },
                  child: ListTile(
                      title: Text(res!.title),
                      subtitle: Text(res.description),
                      onTap: () {}),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _silverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _header(),
                _noteList(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add note',
        backgroundColor: const Color(0xFF7C37FA),
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const WriteNote(),
          ),
        ),
      ),
    );
  }
}
