import 'package:fam_chat/core/constants/colors.dart';
import 'package:fam_chat/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, this.hintText, required this.onchanged});

  final String? hintText;
  final Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: grey.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: body.copyWith(color: grey),
      ),
    );
  }
}
