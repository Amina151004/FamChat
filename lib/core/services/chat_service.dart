import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatService {
  final _fire = FirebaseFirestore.instance;

  saveMessage(String chatRoomId, Map<String, dynamic> message) async {
    try {
      await _fire
          .collection('chatRooms')
          .doc(chatRoomId)
          .collection('messages')
          .add(message);
    } catch (e) {
      rethrow;
    }
  }

  getMessage(String chatRoomId) async {
    return _fire
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .snapshots();
  }
}
