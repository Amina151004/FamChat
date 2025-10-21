import 'package:fam_chat/core/constants/colors.dart';
import 'package:fam_chat/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.buttonText,
    this.onPressed,
    this.loading = false,
  });

  final String? buttonText;
  final Function()? onPressed;

  final bool loading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: onPressed == null ? Colors.grey : primary,
        minimumSize: Size(1.sw, 40.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child:
          loading
              ? const Center(child: CircularProgressIndicator())
              : Text(
                buttonText!,
                style: body.copyWith(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
    );
  }
}
