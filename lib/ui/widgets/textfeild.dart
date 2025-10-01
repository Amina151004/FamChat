import 'package:fam_chat/core/constants/colors.dart';
import 'package:fam_chat/core/constants/string.dart';
import 'package:fam_chat/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.hintText,
    required this.onchanged,
    this.isSearch = false,
    this.isChat = false,
  });

  final String? hintText;
  final Function(String)? onchanged;
  final bool isSearch;
  final bool isChat;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: isChat ? Colors.white : grey.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            isChat ? Radius.circular(25.r) : Radius.circular(10.r),
          ),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: body.copyWith(color: grey),
        suffixIcon:
            isSearch
                ? Container(
                  height: 55,
                  width: 55,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: secondary,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Image.asset(searchIcon),
                )
                : null,
      ),
    );
  }
}
