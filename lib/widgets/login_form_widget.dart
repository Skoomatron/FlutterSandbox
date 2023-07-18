import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() {
    return _LoginFormWidgetState();
  }
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onSubmit() {

    // TODO: Authorization
  }

  void _onRegister() async {
    final AuthResponse res = await supabase.auth.signUp(
      email: _emailController.text,
      password: _passwordController.text,
    );
    final Session? session = res.session;
    final User? user = res.user;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            maxLength: 50,
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
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
              ElevatedButton(onPressed: _onSubmit, child: const Text("Login")),
              TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Forgot Email Not Implemented Yet"),
                    ));
                  },
                  child: const Text("Forgot Password")),
              TextButton(
                  onPressed: _onRegister,
                  child: const Text("Register"))
            ],
          ),
        ],
      ),
    );
  }
}
