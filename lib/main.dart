import 'package:fam_chat/core/services/database_service.dart';
import 'package:fam_chat/core/utils/route_utils.dart';
import 'package:fam_chat/firebase_options.dart';
import 'package:fam_chat/ui/screens/other/user_provider.dart';
import 'package:fam_chat/ui/screens/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
          (context, child) => ChangeNotifierProvider(
            create: (context) => UserProvider(DatabaseService()),
            child: MaterialApp(
              home: SplashScreen(),
              onGenerateRoute: RouteUtils.onGenerateRoute,
              debugShowCheckedModeBanner: false,
            ),
          ),
    );
  }
}
