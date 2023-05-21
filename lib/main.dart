import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> fadeAnimation;
  late AnimationController fadeAnimationControler;

  @override
  void initState() {
    fadeAnimationControler =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    fadeAnimation =
        Tween(begin: 0.0, end: 1.0).animate(fadeAnimationControler.view);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: fadeAnimation,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  fadeAnimationControler.forward();
                },
                child: Text("Show")),
            ElevatedButton(
                onPressed: () {
                  fadeAnimationControler.reverse();
                },
                child: Text("Hide")),
          ],
        ),
      )),
    );
  }
}
