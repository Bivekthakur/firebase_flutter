import 'package:firebase_flutter/feature/google%20login/google_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import '../../facebook/facebook_ctrl.dart';

class GoogleLoginPage extends StatefulWidget {
  const GoogleLoginPage({Key? key}) : super(key: key);

  @override
  State<GoogleLoginPage> createState() => _GoogleLoginPageState();
}

class _GoogleLoginPageState extends State<GoogleLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: Center(
              heightFactor: 14,
              widthFactor: 10,
              child: ElevatedButton(
                onPressed: () {
                  GoogleCtrl.signInWithGoogle(context);
                },
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/one.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Text('Sign In with Google'),
                  ],
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(45.0),
          //   child: Center(
          //     heightFactor: 14,
          //     widthFactor: 10,
          //     child: ElevatedButton(
          //       onPressed: () {
          //         FacebookAuthController.FacebookLogin(context);
          //       },
          //       child: Column(
          //         children: [
          //           Center(
          //             child: Image.asset(
          //               'assets/one.png',
          //               width: 20,
          //               height: 20,
          //             ),
          //           ),
          //           Text('Sign In with Facebook'),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
