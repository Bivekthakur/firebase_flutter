// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
//
// class FacebookAuthController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FacebookLogin _facebookLogin = FacebookLogin();
//
//   Future<User?> signInWithFacebook() async {
//     try {
//       final FacebookLoginResult facebookLoginResult = await _facebookLogin.logIn();
//
//       switch (facebookLoginResult.status) {
//         case FacebookLoginStatus.success:
//           final FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken!;
//           final AuthCredential credential = FacebookAuthProvider.credential(facebookAccessToken.token);
//
//           final UserCredential authResult = await _auth.signInWithCredential(credential);
//
//           return authResult.user;
//         case FacebookLoginStatus.cancel:
//           print('Facebook login cancelled by user');
//           return null;
//         case FacebookLoginStatus.error:
//           print('Error during Facebook login: ${facebookLoginResult.accessToken}');
//           return null;
//       }
//     } catch (e) {
//       print('Error during Facebook login: $e');
//       return null;
//     }
//   }
//
//   Future<void> signOut() async {
//     await _facebookLogin.logOut();
//     await _auth.signOut();
//   }
// }
