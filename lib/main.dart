import 'package:desktop/Home.dart';
import 'package:desktop/compenets/GetState.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences pref ;
void main()async {
  pref = await SharedPreferences.getInstance();
  Get.put(Database());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
   iconTheme: const IconThemeData(color: Colors.white)
      ),
      home: Home()
    );
  }
}

