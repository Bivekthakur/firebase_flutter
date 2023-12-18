import 'package:firebase_flutter/feature/google%20login/google_ctrl.dart';
import 'package:flutter/material.dart';

class GoogleLoginPage extends StatefulWidget {
  const GoogleLoginPage({super.key});

  @override
  State<GoogleLoginPage> createState() => _GoogleLoginPageState();
}

class _GoogleLoginPageState extends State<GoogleLoginPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [

          Center(
            child: ElevatedButton(onPressed: (){
              GoogleCtrl.signInWithGoogle(context);
            }, child: Text('Sign in with Google')),
          )
        ],
      ),
    );
  }
}
