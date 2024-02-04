import 'package:flutter/material.dart';
import 'package:zesa_faults/screens/home_screen.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City Of Bulawayo',
      home: HomeScreen(),
    );
  }
}
