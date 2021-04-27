import 'package:flutter/material.dart';
import 'package:session_live/auth_service.dart';

class HomePage extends StatelessWidget {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Welcome Back'),
        actions: [
          TextButton.icon(
              onPressed: () async{  await _auth.logOut();
              },
              icon: Icon(Icons.logout),
              label: Text('Log out'), style: TextButton.styleFrom(primary: Colors.white),)
        ],
      ),
    );
  }
}
