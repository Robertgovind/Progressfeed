import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "as",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    const Text(
                      "Supervisor",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    const Text(
                      "Contractor",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/user/loginPage");
                },
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    const Text(
                      "User",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/signupPage"),
                child: const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
