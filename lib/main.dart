import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/onboarding/logoscreen.dart';
import 'data/box/box.dart';

import 'model/note.dart';

void main() async {
  // async
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(HiveBoxes.note);
  runApp(
    const NoteApp(),
  );
}

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(360, 690),
      builder: () => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LogoScreen(),
      ),
    );
  }
}
