import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:progressfeed/pages/home_page.dart';
import 'package:progressfeed/pages/login_page.dart';
import 'package:progressfeed/pages/signup_page.dart';
import 'package:progressfeed/pages/splash_secreen.dart';
import 'package:progressfeed/pages/user/login_page.dart';
import 'package:progressfeed/pages/user/set_password.dart';
import 'package:progressfeed/pages/user/signup_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyA_v6KeykOGK09_G1vxHX5NjVobKxdXqNI',
      appId: '1:218847952623:android:212faf92d0f31568a7651a',
      messagingSenderId: '218847952623',
      projectId: 'progressfeed-96f39',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Progress Feed',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 196, 21, 77),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/splash_screen": (context) => SplashScreen(),
        "/loginPage": (context) => const LoginPage(),
        "/signupPage": (context) => const SignupPage(),
        "/user/loginPage": (context) => const UserLoginPage(),
        "/user/signupPage": (context) => const UserSignupPage(),
        "/user/setPassword": (context) => const SetPassword(),
      },
    );
  }
}
