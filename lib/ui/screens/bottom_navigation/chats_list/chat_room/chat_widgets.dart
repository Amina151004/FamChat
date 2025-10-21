import 'package:fam_chat/core/constants/colors.dart';
import 'package:fam_chat/core/constants/styles.dart';
import 'package:fam_chat/core/models/message_model.dart';
import 'package:fam_chat/ui/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BottomField extends StatelessWidget {
  const BottomField({super.key, this.onTap, this.onChanged, this.controller});

  final Function()? onTap;
  final Function(String)? onChanged;

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.15),
      padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 20.h),
      child: Row(
        children: [
          InkWell(
            onTap: null,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.add),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: CustomTextfield(
              controller: controller,
              onchanged: onChanged,
              hintText: "type your message",
              isChat: true,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.isCurrentUser = true,
    required this.message,
  });
  final bool isCurrentUser;
  final Message message;

  @override
  Widget build(BuildContext context) {
    final borderRadius =
        isCurrentUser
            ? BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
              bottomLeft: Radius.circular(16.r),
            )
            : BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            );
    final alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(maxWidth: 1.sw * 0.75, minWidth: 50.w),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isCurrentUser ? primary : grey.withOpacity(0.2),
          borderRadius: borderRadius,
        ),
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
              message.content!,
              style: body.copyWith(color: isCurrentUser ? Colors.white : null),
            ),
            5.verticalSpace,
            Text(
              DateFormat('hh:mm a').format(message.timestamp!),
              style: small.copyWith(color: isCurrentUser ? Colors.white : null),
            ),
          ],
        ),
      ),
    );
  }
}
