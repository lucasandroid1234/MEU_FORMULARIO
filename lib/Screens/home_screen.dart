import 'package:flutter/material.dart';
import '../auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dados do usuário que serão passados como parâmetro
    final Map<String, String> userData = {
      'nomeCompleto': 'Lucas da Silva',
      'dataNascimento': '19/08/1995',
      'telefone': '(11) 98765-4321',
      'timestamp': DateTime.now().toIso8601String(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () {
              AuthService.logout();
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ROTA PRIVADA 🔒\nVocê está autenticado!'),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('Ver Perfil (com parâmetros)'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/profile',
                  arguments: userData,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}