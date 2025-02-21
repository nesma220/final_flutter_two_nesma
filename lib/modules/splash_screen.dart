import 'package:final_flutter_two_nesma/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController()); 

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
          width: 100, 
          height: 100,
          decoration: BoxDecoration(
            color: Colors.black, 
            borderRadius: BorderRadius.circular(20), 
          ),
          child: Padding(
            padding: const EdgeInsets.all(20), 
            child: Image.asset("assets/logo2.png", fit: BoxFit.contain),
          ),
        ),
            const SizedBox(height: 10),
            const Text(
              'Test App',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
