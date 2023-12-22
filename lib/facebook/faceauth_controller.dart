// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//  // Adjust the import based on your project structure
//
// class FacebookAuthController extends StatelessWidget {
//   final FacebookAuthController _facebookAuthController =
//   FacebookAuthController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Facebook Login Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             User? user = await _facebookAuthController.signInWithFacebook();
//
//             if (user != null) {
//               // Successfully signed in with Facebook
//               print('User signed in with Facebook: ${user.displayName}');
//             } else {
//               // Handle unsuccessful login
//               print('Failed to sign in with Facebook');
//             }
//           },
//           child: Text('Sign in with Facebook'),
//         ),
//       ),
//     );
//   }
//
//   signInWithFacebook() {}
// }
