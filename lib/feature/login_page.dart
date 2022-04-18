import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas_2/feature/dashboard_page.dart';
import 'package:tugas_2/feature/register_page.dart';
import 'package:tugas_2/model/account_list_model.dart';
import 'package:tugas_2/tools/common_submit_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Box<AccountListModel> _box = Hive.box<AccountListModel>('account_list');

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            _buildInput(),
            _buildLoginButton(),
            _buildRegisterButton()
          ],
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Form(
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Username'
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if(value == null || value.isEmpty)
                  return 'Username cannot be blank.';
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password'
              ),
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if(value == null || value.isEmpty)
                  return 'Password cannot be blank.';
                return null;
              },
            )
          ],
        )
    );
  }

  Widget _buildLoginButton() {
    return CommonSubmitButton(
        labelButton: 'Login',
        submitCallback: (value) {
          _processLogin();
        }
    );
  }

  void _processLogin() async {
    String _currentUsername = _usernameController.value.text;
    String _currentPassword = _passwordController.value.text;
    for(int i=0; i<_box.length; i++) {
      final user = _box.getAt(i);
      if (_currentUsername == user!.username) {
        if (_currentPassword == user.password) {
          Hive.box('login').put('isLogged', true);
          Hive.box('login').put('username', _currentUsername);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (builder) => DashboardPage()
              )
          );
        }
      }
    }
  }
  
  Widget _buildRegisterButton() {
    return CommonSubmitButton(
        labelButton: 'Register',
        submitCallback: (value) {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => RegisterPage()
              )
          );
        }
    );
  }
}