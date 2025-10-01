import 'package:fam_chat/core/constants/colors.dart';
import 'package:fam_chat/core/constants/string.dart';
import 'package:fam_chat/core/constants/styles.dart';
import 'package:fam_chat/core/enums/enums.dart';
import 'package:fam_chat/core/extension/widget_extensions.dart';
import 'package:fam_chat/core/services/auth_service.dart';
import 'package:fam_chat/core/services/database_service.dart';
import 'package:fam_chat/ui/screens/auth/signup/signup_viewmodel.dart';
import 'package:fam_chat/ui/widgets/button.dart';
import 'package:fam_chat/ui/widgets/textfeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupViewmodel(AuthService(), DatabaseService()),
      child: Consumer<SignupViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 1.sw * 0.05,
                vertical: 10.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  60.verticalSpace,
                  Text("Create your account", style: h),
                  7.verticalSpace,
                  Text(
                    "Please provide the details",
                    style: body.copyWith(color: grey),
                  ),
                  30.verticalSpace,
                  CustomTextfield(
                    hintText: "Enter Name",
                    onchanged: model.setName,
                  ),
                  20.verticalSpace,
                  CustomTextfield(
                    hintText: "Enter Email",
                    onchanged: model.setEmail,
                  ),
                  20.verticalSpace,
                  CustomTextfield(
                    hintText: "Enter Password",
                    onchanged: model.setPassword,
                  ),
                  20.verticalSpace,
                  CustomTextfield(
                    hintText: "Confirm Password",
                    onchanged: model.setConfirmPassword,
                  ),
                  30.verticalSpace,
                  MyButton(
                    loading: model.state == ViewState.loading,
                    buttonText: "Sign Up",
                    onPressed:
                        model.state == ViewState.loading
                            ? null
                            : () async {
                              try {
                                await model.signup();
                                context.showSnackBar(
                                  "Account created successfully",
                                );
                                Navigator.pop(context);
                              } on FirebaseAuthException catch (e) {
                                context.showSnackBar(
                                  e.message ?? "An error occurred",
                                );
                              } catch (e) {
                                context.showSnackBar(e.toString());
                              }
                            },
                  ),
                  30.verticalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: body.copyWith(color: grey),
                      ),
                      5.verticalSpace,
                      InkWell(
                        onTap: () {
                          // Navigate to login screen
                          Navigator.pushNamed(context, login);
                        },
                        child: Text(
                          "Login",
                          style: body.copyWith(
                            color: primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
