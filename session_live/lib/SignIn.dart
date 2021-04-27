import 'package:flutter/material.dart';
import 'package:session_live/auth_service.dart';

class Signin extends StatefulWidget {
  final Function toggleview;
  Signin({this.toggleview});
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String email,password;
  final _auth = AuthService();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Welcome'),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleview();
            },
            icon: Icon(Icons.app_registration),
            label: Text(
              'Not a member? Join us',
            ),
            style: TextButton.styleFrom(primary: Colors.white),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color.fromRGBO(0, 250, 0, 0.12),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
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
                    dynamic result = await _auth.signIn(email, password);
                    if(result==null)
                      {
                        print('Invalid User Credentials');
                      }
                  }
                }, child: Text('Sign in'))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
