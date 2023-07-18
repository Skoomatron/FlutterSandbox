import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onSubmit() {
    if (_emailController.text == null ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _passwordController.text == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Email and password can not be empty"),
      ));
    }

    // TODO: Authorization
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GCK MOCK"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              maxLength: 50,
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              keyboardType: TextInputType.text,
              autocorrect: false,
              obscureText: true,
              maxLength: 50,
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _onSubmit, child: const Text("Login")),
                TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Forgot Email Not Implemented Yet"),
                      ));
                    },
                    child: const Text("Forgot Password"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
