import 'package:hive/hive.dart';

part 'account_list_model.g.dart';

@HiveType(typeId: 0)
class AccountListModel extends HiveObject {
  AccountListModel({required this.username, required this.password});

  @HiveField(0)
  String username;

  @HiveField(1)
  String password;

  @override
  String toString() {
    return 'AccountListModel{username: $username, password: $password}';
  }
}