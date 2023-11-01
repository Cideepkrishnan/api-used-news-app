import 'package:flutter/material.dart';
import 'package:news/provider/my_provider.dart';
import 'package:news/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Homescreen_provider(),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: splash_screen()));
  }
}
