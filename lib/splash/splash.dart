
import 'package:flutter/material.dart';

import '../core/color/color.dart';
import '../presentation/mainpage/screen_main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    Future.delayed(const Duration(milliseconds: 2700), (){
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ScreenMainPage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Image.asset(
          'assets/netflixgif.gif',
          width: 235,
          height: 235,
        )
      ),
    );
  }
}
