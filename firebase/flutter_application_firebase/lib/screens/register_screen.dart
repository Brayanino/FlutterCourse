import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/services/auth_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RegisterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                await ref.read(authenticationServiceProvider).signUp(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                if (context.mounted) context.go('/');
              },
              child: const Text('Register'),
            ),
            TextButton(
              onPressed: () => context.go('/login'),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
