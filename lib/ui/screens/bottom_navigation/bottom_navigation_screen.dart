import 'package:fam_chat/core/constants/string.dart';
import 'package:fam_chat/core/models/user_model.dart';
import 'package:fam_chat/core/services/auth_service.dart';
import 'package:fam_chat/ui/screens/bottom_navigation/bottom_navigation_viewmodel.dart';
import 'package:fam_chat/ui/screens/bottom_navigation/chats_list/chats_list_screen.dart';
import 'package:fam_chat/ui/screens/bottom_navigation/profile/profile_screen.dart';
import 'package:fam_chat/ui/screens/home/home_screen.dart';
import 'package:fam_chat/ui/screens/other/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});
  static final List<Widget> _screens = [
    HomeScreen(),
    ChatsListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;
    return currentUser == null
        ? Center(child: CircularProgressIndicator())
        : ChangeNotifierProvider(
          create: (context) => BottomNavigationViewmodel(),
          child: Consumer<BottomNavigationViewmodel>(
            builder: (context, model, _) {
              return Scaffold(
                body: BottomNavigationScreen._screens[model.currentIndex],
                bottomNavigationBar: CustomNavBar(onTap: model.onTap),
              );
            },
          ),
        );
  }
}

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, this.onTap});
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    const borderRad = BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
    );
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        borderRadius: borderRad,
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRad,
        child: BottomNavigationBar(
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(homeIcon, height: 30.0, width: 30.0),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(chatsIcon, height: 32.0, width: 32.0),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(profileIcon, height: 30.0, width: 30.0),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
