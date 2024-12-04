import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/doctor_list_screen.dart';

void main() {
  runApp(MedicoApp());
}

class MedicoApp extends StatelessWidget {
  const MedicoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/doctors': (context) => DoctorListScreen(),
      },
    );
  }
}
