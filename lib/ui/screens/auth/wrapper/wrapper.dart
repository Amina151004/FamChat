import 'package:fam_chat/ui/screens/auth/login/login_screen.dart';
import 'package:fam_chat/ui/screens/bottom_navigation/bottom_navigation_screen.dart';
import 'package:fam_chat/ui/screens/home/home_screen.dart';
import 'package:fam_chat/ui/screens/other/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return const LoginScreen();
          } else {
            userProvider.loadUser(user.uid);
            return const BottomNavigationScreen(); // Replace with your home screen widget
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
