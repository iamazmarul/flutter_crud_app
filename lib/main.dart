import 'package:flutter/material.dart';
import 'package:flutter_crud_app/screens/homescreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "CRUD",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
