import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rotas Nomeadas',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        cardTheme: const CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (AuthService.isAuthenticated) {
          switch (settings.name) {
            case '/':
            case '/home':
              return MaterialPageRoute(builder: (context) => const HomeScreen());
            case '/profile':
              return MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
                settings: settings,
              );
            default:
              return MaterialPageRoute(builder: (context) => const HomeScreen());
          }
        } else {
          return MaterialPageRoute(builder: (context) => const LoginScreen());
        }
      },
    );
  }
}