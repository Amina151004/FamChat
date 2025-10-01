import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final _fire = FirebaseFirestore.instance;

  Future<void> saveUser(Map<String, dynamic> userData) async {
    try {
      await _fire.collection('users').doc(userData['uid']).set(userData);
      print("user save !");
    } catch (e) {
      print("Error saving user data: $e");
      throw e;
    }
  }

  Future<Map<String, dynamic>?> loadUser(String uid) async {
    try {
      final doc = await _fire.collection('users').doc(uid).get();
      if (doc.exists) {
        print("User data loaded successfully: ${doc.data()}");
        return doc.data();
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching user data: $e");
      throw e;
    }
  }
}
