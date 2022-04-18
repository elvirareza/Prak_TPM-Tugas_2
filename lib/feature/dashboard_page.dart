import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas_2/feature/login_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _box = Hive.box('login');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Page"),
        actions:[IconButton(
            onPressed: () {
              _box.put('isLogged', false);
              _box.delete('username');
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => LoginPage()
                  )
              );
            },
            icon: Icon(Icons.logout_rounded))],
      ),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, ${_box.get('username')}',
              style: TextStyle(
                fontSize: 20
              ),
            )
          ],
        ),
    );
  }
}
