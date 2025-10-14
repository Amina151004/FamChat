import 'package:fam_chat/core/constants/string.dart';
import 'package:fam_chat/core/models/user_model.dart';
import 'package:fam_chat/ui/screens/auth/login/login_screen.dart';
import 'package:fam_chat/ui/screens/auth/signup/signup_screen.dart';
import 'package:fam_chat/ui/screens/auth/wrapper/wrapper.dart';
import 'package:fam_chat/ui/screens/bottom_navigation/chats_list/chat_room/chat_screen.dart';
import 'package:fam_chat/ui/screens/bottom_navigation/profile/profile_screen.dart';
import 'package:fam_chat/ui/screens/home/home_screen.dart';
import 'package:fam_chat/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen());

      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case wrapper:
        return MaterialPageRoute(builder: (context) => const Wrapper());
      case chatroom:
        return MaterialPageRoute(
          builder: (context) => ChatScreen(receiver: args as UserModel),
        );
      case profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());

      default:
        return MaterialPageRoute(
          builder:
              (context) =>
                  const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
