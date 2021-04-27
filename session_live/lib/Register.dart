import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:core';

import 'package:session_live/auth_service.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  Register({this.toggleview});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email,password;
  final _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Welcome'),
        actions: [
          TextButton.icon(
            onPressed: () {
            widget.toggleview();
            },
            icon: Icon(Icons.login),
            label: Text(
              'Already a member ? Sign in',
            ),
            style: TextButton.styleFrom(primary: Colors.white),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color.fromRGBO(0, 0, 250, 0.1),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  validator: (val)=>val.isEmpty?'Please fill your name':null,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    fillColor: Colors.white,
                    filled:true,
                    prefixIcon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                  },
                  validator: (val)=>val.isEmpty?'Please fill your email':null,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled:true,
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (val){
                    setState(() {
                      password=val;
                    });
                  },
                  validator: (val)=>val.isEmpty?'Please fill your password':null,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.white,
                    filled:true,
                    prefixIcon: Icon(Icons.vpn_key),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () async{
                  if(_formkey.currentState.validate())
                    {
                      dynamic result = await _auth.signUp(email, password);
                      if(result==null)
                        {
                          print('Sign Up failed');
                    }

                  }
                }, child: Text('Register'))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
