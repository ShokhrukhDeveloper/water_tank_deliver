import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:water_tank_deliver/Data/Storage/LocalStorage.dart';
import 'package:water_tank_deliver/Pages/HomePage/HomePage.dart';
import 'package:water_tank_deliver/Pages/SignInPage/SignInPage.dart';

import 'API/MyHttp.dart';

void main()async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home:LocalStorage.getToken()==null? const SignInPage(): const HomePage(),
    );
  }
}
