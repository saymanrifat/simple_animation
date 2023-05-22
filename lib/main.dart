import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  late Animation<Offset> slideAnimation;
  late AnimationController slideAnimationController;

  @override
  void initState() {
    slideAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slideAnimation = Tween(begin: const Offset(-10, 0), end: const Offset(0, 0))
        .animate(slideAnimationController.view);
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
            SlideTransition(
              position: slideAnimation,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  slideAnimationController.forward();
                },
                child: const Text("Show")),
            ElevatedButton(
                onPressed: () {
                  slideAnimationController.reverse();
                },
                child: const Text("Hide")),
          ],
        ),
      )),
    );
  }
}
