import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tugas_2/model/account_list_model.dart';
import 'package:tugas_2/tools/common_submit_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _box = Hive.box<AccountListModel>('account_list');

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            _buildInput(),
            _buildSubmitButton(),
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

  Widget _buildSubmitButton() {
    return Container(
      child: CommonSubmitButton(
        labelButton: 'Register',
        submitCallback: (String) {
          if(_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
            bool check = false;
            for(int i=0;i<_box.length;i++) {
              final user = _box.getAt(i);
              if(user!.username == _usernameController.text) {
                check = true;
                break;
              }
            }
            if(check == false) {
              final user = AccountListModel(
                username: _usernameController.text,
                password: _passwordController.text,
              );
              _box.add(user);
              Navigator.of(context).pop();
            }
          }
        },
      ),
    );
  }
}
