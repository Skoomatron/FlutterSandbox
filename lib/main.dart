import 'package:flutter/material.dart';
import 'package:gck_mock/screens/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gck_mock/secrets.dart' as secrets;

Future<void> main() async {
  await Supabase.initialize(
    url: secrets.supabase,
    anonKey: secrets.supaKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GCK Mock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
