import 'package:fam_chat/core/models/user_model.dart';
import 'package:fam_chat/core/other/base_viewmodel.dart';
import 'package:fam_chat/core/services/chat_service.dart';

class ChatViewmodel extends BaseViewmodel {
  final ChatService _chatService;
  final UserModel _receiver;
  final UserModel _currentUser;

  ChatViewmodel(this._chatService, this._receiver, this._currentUser) {
    // Initialize chat fetching or other setup here
  }

  String chatRoomId = "";
  saveMessage() async {
    try {
      await _chatService.saveMessage(chatRoomId, {});
    } catch (e) {
      rethrow;
    }
  }
}
