import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,  // To make All screens color transparent in app
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Stack(
        children: [
          // Set the background image
          Positioned.fill(
            child: Image.asset(
              'images/background.jpeg', // Path to your image asset
              fit: BoxFit.cover,
            ),
          ),
          // The rest of the app content will be above the background image
          Scaffold(
            backgroundColor: Colors.transparent, // Make the Scaffold transparent
            resizeToAvoidBottomInset: false,
            body: Login(),
          ),
        ],
      ),
    );
  }
}
