import 'package:fam_chat/core/constants/styles.dart';
import 'package:fam_chat/core/models/user_model.dart';
import 'package:fam_chat/core/services/chat_service.dart';
import 'package:fam_chat/ui/screens/bottom_navigation/chats_list/chat_room/chat_viewmodel.dart';
import 'package:fam_chat/ui/screens/bottom_navigation/chats_list/chat_room/chat_widgets.dart';
import 'package:fam_chat/ui/screens/other/user_provider.dart';
import 'package:fam_chat/ui/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.receiver});
  final UserModel receiver;
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).user;
    return ChangeNotifierProvider(
      create: (context) => ChatViewmodel(ChatService(), currentUser!, receiver),
      child: Consumer<ChatViewmodel>(
        builder: (context, model, _) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.sw * 0.05,
                      vertical: 10.h,
                    ),
                    child: Column(
                      children: [
                        35.verticalSpace,
                        _buildHeader(context, name: receiver.name!),
                        25.verticalSpace,
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(0),
                            separatorBuilder:
                                (context, index) => 10.verticalSpace,
                            itemCount: model.messages.length,
                            itemBuilder: (context, index) {
                              final message = model.messages[index];
                              return ChatBubble(
                                isCurrentUser:
                                    message.senderId == currentUser!.uid,
                                message: message,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                BottomField(
                  controller: model.messageController,
                  onTap: () {
                    model.saveMessage();
                  },
                  onChanged: (p0) {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Row _buildHeader(BuildContext context, {String name = ""}) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.only(left: 10, top: 6, bottom: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.grey.withOpacity(0.15),
            ),
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        15.horizontalSpace,
        Text(name, style: h.copyWith(fontSize: 20.sp)),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.grey.withOpacity(0.15),
          ),
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
