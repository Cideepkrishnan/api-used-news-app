import 'package:flutter/material.dart';
import 'package:news/utils/image_constant.dart';
import 'package:news/view/Bottom_screen/bottom_screen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => bottom())));
  }

  bool isloading = true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 229),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Image.asset(
            imageConstant.splash,
            fit: BoxFit.cover,
          ))
        ],
      ),
    );
  }
}
