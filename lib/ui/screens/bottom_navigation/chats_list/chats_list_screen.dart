import 'package:fam_chat/core/constants/colors.dart';
import 'package:fam_chat/core/constants/string.dart';
import 'package:fam_chat/core/constants/styles.dart';
import 'package:fam_chat/core/enums/enums.dart';
import 'package:fam_chat/core/models/user_model.dart';
import 'package:fam_chat/core/services/database_service.dart';
import 'package:fam_chat/ui/screens/bottom_navigation/chats_list/chats_list_viewmodel.dart';
import 'package:fam_chat/ui/screens/other/user_provider.dart';
import 'package:fam_chat/ui/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;
    return currentUser == null
        ? CircularProgressIndicator()
        : ChangeNotifierProvider(
          create:
              (context) => ChatsListViewmodel(DatabaseService(), currentUser!),
          child: Consumer<ChatsListViewmodel>(
            builder: (context, model, _) {
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
                    CustomTextfield(
                      onchanged: model.search,
                      isSearch: true,
                      hintText: "Search",
                    ),
                    10.verticalSpace,
                    model.state == ViewState.loading
                        ? Expanded(
                          child: Center(child: CircularProgressIndicator()),
                        )
                        : Expanded(
                          child:
                              model.filteredUsers.isEmpty
                                  ? const Center(
                                    child: Text("No chats available"),
                                  )
                                  : ListView.separated(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 0,
                                    ),
                                    separatorBuilder:
                                        (context, index) => 8.verticalSpace,
                                    itemCount: model.filteredUsers.length,
                                    itemBuilder: (context, index) {
                                      final user = model.filteredUsers[index];
                                      return ChatTile(
                                        user: user,
                                        onTap:
                                            () => Navigator.pushNamed(
                                              context,
                                              chatroom,
                                              arguments: user,
                                            ),
                                      );
                                    },
                                  ),
                        ),
                  ],
                ),
              );
            },
          ),
        );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, this.onTap, required this.user});
  final UserModel user;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      tileColor: grey.withOpacity(0.12),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
      leading: CircleAvatar(
        backgroundColor: grey,
        radius: 30,
        child: Text(
          (user.name != null && user.name!.isNotEmpty)
              ? user.name![0].toUpperCase()
              : '?',
        ),
      ),
      title: Text(user.name!),
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
