import 'package:flutter/material.dart';
import 'package:tcms/getstarted.dart';
import 'package:tcms/login.dart';
import 'package:device_preview/device_preview.dart';
import 'package:tcms/newstudent.dart';
import 'package:tcms/register.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCMS',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const NewStudentPage(),
    );
  }
}
