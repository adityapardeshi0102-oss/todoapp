import 'package:flutter/material.dart';
import 'package:todoapp/screens/all_tasks_screen.dart';
import 'package:todoapp/screens/sign_in_screen.dart';
import 'package:todoapp/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        
          initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/all_task':(context)=> TodayScreen(),
      },
    );
  }
}
