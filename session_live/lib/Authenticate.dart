import 'package:flutter/material.dart';
import 'package:session_live/Register.dart';
import 'package:session_live/SignIn.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    return toggle?Register(toggleview: change):Signin(toggleview: change);
  }

  void change()
  {
    setState(() {
      toggle = !toggle;
    });
  }
}


