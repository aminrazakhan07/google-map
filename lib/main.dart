// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_map/demo_scr/google_map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp()); // MyApp کو کیمرہ کے ساتھ چلائیں
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Camera App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoogleMapScreen(), // IDScannerPage کو کیمرہ دیں
    );
  }
}
