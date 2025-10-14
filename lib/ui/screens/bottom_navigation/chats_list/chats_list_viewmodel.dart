import 'package:fam_chat/core/enums/enums.dart';
import 'package:fam_chat/core/models/user_model.dart';
import 'package:fam_chat/core/other/base_viewmodel.dart';
import 'package:fam_chat/core/services/database_service.dart';

class ChatsListViewmodel extends BaseViewmodel {
  final DatabaseService _db;
  final UserModel _currentUser;
  ChatsListViewmodel(this._db, this._currentUser) {
    fetchUsers();
  }

  List<UserModel> _users = [];
  List<UserModel> _filteredUsers = [];
  List<UserModel> get users => _users;
  List<UserModel> get filteredUsers => _filteredUsers;

  search(String value) {
    if (value.isEmpty) {
      _filteredUsers = _users;
    } else {
      _filteredUsers =
          _users
              .where(
                (user) =>
                    user.name!.toLowerCase().contains(value.toLowerCase()),
              )
              .toList();
    }
    notifyListeners();
  }

  fetchUsers() async {
    try {
      setState(ViewState.loading);
      final res = await _db.fetchUsers(_currentUser.uid!);

      if (res != null) {
        _users = res.map((e) => UserModel.fromMap(e)).toList();
        _filteredUsers = _users;
        notifyListeners();
      }
      setState(ViewState.idle);
    } catch (e) {
      setState(ViewState.idle);
      print("Error fetching users: $e");
    }
  }
}
