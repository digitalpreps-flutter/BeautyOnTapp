import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 5s ke baad Login pe le jao
    Timer(const Duration(seconds: 5), () {
      Get.offAllNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    // Responsive dimensions based on Figma ratio
    final double logoWidth = size.width * 0.75;  // ~75% of screen width
    final double logoHeight = logoWidth * (175 / 310); // keep aspect ratio

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: logoWidth,
          height: logoHeight,
          child: Image.asset(
            'assets/images/logo.png', // apna asset yahan rakhen
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
