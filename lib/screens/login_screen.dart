import 'package:flutter/material.dart';
import 'package:gck_mock/widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GCK MOCK"),
      ),
      body: const Center(
        child: LoginFormWidget(),
      ),
    );
  }
}
