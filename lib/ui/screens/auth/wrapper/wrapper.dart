import 'package:fam_chat/ui/screens/auth/login/login_screen.dart';
import 'package:fam_chat/ui/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return const LoginScreen();
          } else {
            return const HomeScreen(); // Replace with your home screen widget
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
