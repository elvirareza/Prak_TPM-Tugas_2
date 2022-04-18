import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas_2/feature/dashboard_page.dart';
import 'package:tugas_2/feature/login_page.dart';
import 'package:tugas_2/model/account_list_model.dart';
late Box _box;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AccountListModelAdapter());
  await Hive.openBox<AccountListModel>('account_list');
  _box = await Hive.openBox('login');
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _box.get('isLogged', defaultValue: false)? DashboardPage():LoginPage(),
    );
  }
}
