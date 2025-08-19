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
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(vertical: 8),
        ),
      ),
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        // Rota pública que não precisa de verificação
        if (settings.name == '/login') {
          return MaterialPageRoute(builder: (context) => const LoginScreen());
        }

        // --- A PARTIR DAQUI, TODAS AS ROTAS SÃO PRIVADAS ---
        
        // Verifica se o usuário está autenticado
        if (AuthService.isAuthenticated) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (context) => const HomeScreen());
            case '/profile':
              // Para a rota de perfil, passamos os settings para que a tela
              // possa extrair os argumentos.
              return MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
                settings: settings,
              );
            default:
              // Se a rota privada não existir, vai para a home
              return MaterialPageRoute(builder: (context) => const HomeScreen());
          }
        }

        // Se o usuário não estiver autenticado, redireciona para o login
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      },
    );
  }
}