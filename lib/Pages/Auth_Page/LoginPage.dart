import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'LoginController.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      controller: controller.emailController,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 28, 195, 178)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 28, 195, 178)),
                        ),
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 28, 195, 178)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      cursorColor: Colors.white,
                      controller: controller.passwordController,
                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 28, 195, 178)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 28, 195, 178)),
                        ),
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 28, 195, 178)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 28, 195, 178))),
                      onPressed: controller.signInWithEmailAndPassword,
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: controller.navigateToSignUp,
                      child: const Text("Don't have an account? Sign up",
                          style: TextStyle(
                              color: Color.fromARGB(255, 28, 195, 178))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
