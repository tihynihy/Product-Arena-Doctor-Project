import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:product_arena_x_tech_387/login_page.dart';

void main(){
  runApp(AnimatedIntroduction());
}

class AnimatedIntroduction extends StatefulWidget {
  AnimatedIntroduction({Key? key}) : super(key: key);

  @override
  _AnimatedIntroductionState createState() => _AnimatedIntroductionState();
}

class _AnimatedIntroductionState extends State<AnimatedIntroduction> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EasySplashScreen(
        logoWidth: 300,
        logo: Image.network(
            width: 300,
            'https://user-images.githubusercontent.com/76163793/205488097-a2fd3a49-9d74-4da5-86a9-7355df451d5d.png'),
        backgroundColor: Colors.white,
        showLoader: true,
        loadingText: Text("Loading..."),
        navigator: LoginScreen(),
        durationInSeconds: 8,
      ),
    );
  }
}