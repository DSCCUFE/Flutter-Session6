import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_live/Authenticate.dart';
import 'package:session_live/Homepage.dart';
import 'package:session_live/Register.dart';
import 'package:session_live/SignIn.dart';
import 'package:session_live/UserScreen.dart';
import 'package:session_live/auth_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: UserScreen(),
      ),
    );
  }
}

