import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import '../data/box/box.dart';
import 'all_notes.dart';
import 'home_page.dart';
import 'plan_page.dart';
import '../model/note.dart';

class WriteNote extends StatefulWidget {
  const WriteNote({Key? key}) : super(key: key);

  @override
  _WriteNoteState createState() => _WriteNoteState();
}

class _WriteNoteState extends State<WriteNote> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  late final title;
  // ignore: prefer_typing_uninitialized_variables
  late final description;
  validate() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _onFormSubmit();
      // print('Form Validate');
    } else {
      // print('FOrm is not Validate');
    }
  }

  String dropdownValue = 'All notes';

  void _onFormSubmit() {
    Box<Note> contactsBox = Hive.box<Note>(HiveBoxes.note);

    contactsBox.add(Note(title: title, description: description));
    Navigator.of(context).pop();
  }

  Widget _action() {
    return Row(
      children: [
        const Icon(
          Icons.notifications_sharp,
          color: Color(0xFF0F0A39),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChoosePlan(),
              ),
            );
          },
          icon: const Icon(
            Icons.info,
            color: Color(0xFF0F0A39),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
            color: Color(0xFF0F0A39),
          ),
        ),
        TextButton(
          onPressed: () {
            validate();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AllNotes(),
              ),
            );
          },
          child: Text(
            'Done',
            style: TextStyle(
                color: const Color(0xFF0F0A39),
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _dropDownButton() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 30.h),
      child: Container(
        // height: 2,
        width: 110.w,
        // color: Colors.deepPurpleAccent,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            // border: Border.all(),
            color: Colors.grey.withOpacity(0.2)
            // color: const Color(0xFF7C37FA),
            ),
        child: Padding(
          padding: EdgeInsets.only(left: 8.w, right: 8.w),
          child: DropdownButton<String>(
            // borderRadius: BorderRadius.circular(10.r),

            value: dropdownValue,

            icon: const Icon(
              Icons.arrow_drop_down,
              color: Color(0xFF7C37FA),
            ),
            // elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),

            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['All notes', 'All noes']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      color: const Color(0xFF7C37FA),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _writtingField() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                // autofocus: true,
                initialValue: '',
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(fontSize: 20.sp, color: Colors.grey),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "required";
                  }
                  return null;
                },
              ),
              const Divider(),
              TextFormField(
                initialValue: '',
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Start writting',
                  labelStyle: TextStyle(fontSize: 20.sp, color: Colors.grey),
                ),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "required";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite.w, 50.h),
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
          actions: [
            _action(),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _dropDownButton(),
          _writtingField(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/Leaf.png'),
              ),
              label: ''
              // backgroundColor: Colors.red,
              ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/Camera.png'),
              ),
              label: ''
              // backgroundColor: Colors.green,
              ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/mic.png'),
            ),
            backgroundColor: Colors.purple,
            label: '',
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/attach.png'),
              ),
              label: ''
              // backgroundColor: Colors.pink,
              ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF7C37FA),
        unselectedItemColor: Colors.grey,
        // onTap: _onItemTapped(){},
      ),
    );
  }
}
// 0F0A39
