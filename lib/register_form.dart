import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Registration successful!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Zа-яА-ЯәіңғүұқөһӘІҢҒҮҰҚӨҺ ]'),
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
                validator: (value) {
                  if (value == null || value.length != 11) {
                    return 'Enter 11 digits';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null ||
                      !RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(12)],
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Minimum 6 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: register,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
