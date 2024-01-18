import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SplashScreenController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset("assets/logo.png")),
                    Text(
                      "My Online Library",
                      style: GoogleFonts.novaSquare(
                          color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
              ));
        });
  }
}
