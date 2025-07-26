import 'package:fam_chat/core/utils/route_utils.dart';
import 'package:fam_chat/firebase_options.dart';
import 'package:fam_chat/ui/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FamChat());
}

class FamChat extends StatelessWidget {
  const FamChat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:
          (context, child) => MaterialApp(
            home: SplashScreen(),
            onGenerateRoute: RouteUtils.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          ),
    );
  }
}
