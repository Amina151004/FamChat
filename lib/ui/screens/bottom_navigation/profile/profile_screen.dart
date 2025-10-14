import 'package:fam_chat/core/services/auth_service.dart';
import 'package:fam_chat/ui/screens/other/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            AuthService().logout();
            Provider.of<UserProvider>(context, listen: false).clearUser();
          },
          child: Text('Welcome (Tap to logout)'),
        ),
      ),
    );
  }
}
