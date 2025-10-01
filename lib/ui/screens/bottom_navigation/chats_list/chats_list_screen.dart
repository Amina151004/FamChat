import 'package:fam_chat/core/constants/colors.dart';
import 'package:fam_chat/core/constants/string.dart';
import 'package:fam_chat/core/constants/styles.dart';
import 'package:fam_chat/ui/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.05),
      child: Column(
        children: [
          50.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Chats", style: h),
          ),
          20.verticalSpace,
          CustomTextfield(onchanged: null, isSearch: true, hintText: "Search"),
          10.verticalSpace,
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              separatorBuilder: (context, index) => 8.verticalSpace,
              itemCount: 10,
              itemBuilder:
                  (context, index) => ChatTile(
                    onTap: () => Navigator.pushNamed(context, chatroom),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      tileColor: grey.withOpacity(0.12),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
      leading: const CircleAvatar(
        backgroundColor: grey,
        child: Text("S"),
        radius: 30,
      ),
      title: Text("data"),
      subtitle: Text(
        "last message",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("15min ago", style: body.copyWith(color: grey)),
          5.verticalSpace,
          CircleAvatar(
            backgroundColor: primary,
            radius: 9.r,
            child: Text("1", style: body.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
