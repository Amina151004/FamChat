import 'dart:async';

import 'package:fam_chat/core/models/message_model.dart';
import 'package:fam_chat/core/models/user_model.dart';
import 'package:fam_chat/core/other/base_viewmodel.dart';
import 'package:fam_chat/core/services/chat_service.dart';
import 'package:flutter/cupertino.dart';

class ChatViewmodel extends BaseViewmodel {
  final ChatService _chatService;
  final UserModel _receiver;
  final UserModel _currentUser;

  StreamSubscription?
  _subscription; //keeps listening for new messages (live updates).

  ChatViewmodel(this._chatService, this._currentUser, this._receiver) {
    getChatRoomId();

    _subscription = _chatService.getMessage(chatRoomId).listen((messages) {
      _messages = messages.docs.map((e) => Message.fromMap(e.data())).toList();
      notifyListeners();
    });
  }

  /* It then starts listening for messages from that chat room.

Every time a new message appears, it:

Converts it to Message objects.

Updates _messages.

Calls notifyListeners() → tells the UI to refresh (so new messages show up). */

  String chatRoomId = "";
  final _messageController = TextEditingController();
  TextEditingController get messageController => _messageController;

  List<Message> _messages = [];
  List<Message> get messages => _messages;

  getChatRoomId() {
    if (_currentUser.uid.hashCode > _receiver.uid.hashCode) {
      chatRoomId = "${_currentUser.uid}-${_receiver.uid}";
    } else {
      chatRoomId = "${_receiver.uid}-${_currentUser.uid}";
    }
  }

  saveMessage() async {
    try {
      if (_messageController.text.trim().isEmpty) return;
      print('Sending message: ${_messageController.text}');
      final now = DateTime.now();
      final message = Message(
        id: now.microsecondsSinceEpoch.toString(),
        content: _messageController.text,
        senderId: _currentUser.uid,
        receiverId: _receiver.uid,
        timestamp: now,
      );
      await _chatService.saveMessage(chatRoomId, message.toMap());
      print('Message saved!');
      _messageController.clear();
    } catch (e) {
      print('Error saving message: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
