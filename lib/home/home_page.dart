import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../dialog/writing.dart';
import '../navigation/homePages/favorite.dart';
import '../navigation/homePages/profile.dart';
import '../navigation/homePages/search.dart';
import '../data/box/box.dart';
import '../model/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _searchBar() {
    return Padding(
      padding: EdgeInsets.only(top: 70.h, left: 20.w, right: 20.w),
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

  Widget _twoImages() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 170.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(
              image: AssetImage('images/left.png'),
            ),
            SizedBox(
              width: 20.w,
            ),
            const Image(
              image: AssetImage('images/right.png'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _twoText() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'All note',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 110.w,
          ),
          Text(
            'Notebook',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _recentText() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 30.h),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Recent',
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _noteList() {
    return SingleChildScrollView(
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
            }),
      ),
    );
  }

  @override
  void dispose() async {
    Hive.close();
    super.dispose();
  }

  _onTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => _pages[selectedPage]));
  }

  int selectedPage = 0;
  final _pages = [
    const HomePage(),
    const Search(),
    const Favorite(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _searchBar(),
          _twoImages(),
          _twoText(),
          _recentText(),
          SizedBox(
            height: 20.h,
          ),
          _noteList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add note',
        backgroundColor: const Color(0xFF7C37FA),
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const PopDialog(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.transparent,
        elevation: 0.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/Leaf.png'),
            ),
            label: 'Home',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/search.png'),
            ),
            label: 'Search',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/bookmark.png'),
              // color: Colors.grey,
            ),
            label: 'favorite',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/profile.png'),
            ),
            label: 'Profile',
            // backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: selectedPage,
        selectedItemColor: const Color(0xFF7C37FA),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
          _onTap();
        },
      ),
    );
  }
}
