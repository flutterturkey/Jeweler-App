import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_bottom_bar.dart';
import 'pages/order.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) =>
      MaterialApp(
        title: 'Jeweler App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.teal,
          colorScheme:
          ThemeData().colorScheme.copyWith(primary: Colors.teal),
        ),
        home: const MyBottomNavigationBar(),
      ),
    );
  }
}
