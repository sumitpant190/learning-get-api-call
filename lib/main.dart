import 'package:apis/example_two.dart';
import 'package:apis/signup.dart';
import 'package:apis/upload_image.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UploadImageScreen(),
    );
  }
}
