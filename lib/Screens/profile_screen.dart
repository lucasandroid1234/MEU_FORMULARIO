import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

    // Fallback caso os argumentos sejam nulos
    if (arguments == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Erro')),
        body: const Center(child: Text('Nenhum dado de usuário foi fornecido.')),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ROTA PRIVADA 🔒\nEstes dados foram recebidos via parâmetro:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Nome Completo'),
                subtitle: Text(arguments['nomeCompleto'] ?? 'Não informado'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Data de Nascimento'),
                subtitle: Text(arguments['dataNascimento'] ?? 'Não informado'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Telefone'),
                subtitle: Text(arguments['telefone'] ?? 'Não informado'),
              ),
            ),
             Card(
              child: ListTile(
                leading: const Icon(Icons.timer),
                title: const Text('Timestamp do Parâmetro'),
                subtitle: Text(arguments['timestamp'] ?? 'Não informado'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}