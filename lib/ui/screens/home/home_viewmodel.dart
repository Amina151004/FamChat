import 'package:fam_chat/core/enums/enums.dart';
import 'package:fam_chat/core/models/user_model.dart';
import 'package:fam_chat/core/other/base_viewmodel.dart';
import 'package:fam_chat/core/services/database_service.dart';

class HomeViewmodel extends BaseViewmodel {
  final DatabaseService _db;

  HomeViewmodel(this._db) {}
}
