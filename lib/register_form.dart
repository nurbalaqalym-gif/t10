import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Form'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              'Registration',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // TextField
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 20),

            // TextFormField
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
