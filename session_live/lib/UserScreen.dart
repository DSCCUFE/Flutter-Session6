import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_live/Authenticate.dart';
import 'package:session_live/Homepage.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user!=null?HomePage():Authenticate();
  }
}
