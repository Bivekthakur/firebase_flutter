import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter/feature/google%20login/google_login_page.dart';
import 'package:firebase_flutter/feature/google%20login/login_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
   ProfilePage({super.key, required this.userEmail, required this.userName, required this.userPhotoURL});

  final String userEmail;
  final String userName;
  final String userPhotoURL;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _logout() async {
    try {
      await FirebaseAuth.instance.signOut();

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GoogleLoginPage()));
      // You can navigate to the login page or perform other logout actions here
    } catch (e) {
      print('Error logging out: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Center(child: Text('Profile')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.userPhotoURL),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email: ${widget.userEmail}',
              style: TextStyle(color: Colors.white,
                  fontSize: 16
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Username: ${widget.userName}',
              style: TextStyle(color:Colors.white,
                  fontSize: 16
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: _logout, child: Text('log_out')
            ),
          ],
        ),
      ),
    );
  }
  }









