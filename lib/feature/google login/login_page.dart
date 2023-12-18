import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  late GoogleSignInAccount _currentUser;
  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account!;
      });
      if(_currentUser!=null) {
        print('user is already aunthicated');
      }
    });
    _googleSignIn.signInSilently();

  }

  Future<void> handleSignIn() async {
    try{
      await _googleSignIn.signIn();
    } catch(error) {
      print('Sign in Error : '+error.toString());
    }
  }

  Future<void> handleSignOut() => _googleSignIn.disconnect();
  Widget buildBody() {
    GoogleSignInAccount user = _currentUser;
    if(user!=null) {
      return Column(
        children: [
          SizedBox(height: 90,),
          GoogleUserCircleAvatar(identity: user),
          SizedBox(height: 20,),
          Center(
            child: Text(
              user.displayName ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text(user.email,
              textAlign: TextAlign.center,
              style: TextStyle(color:Colors.white,fontSize: 15),
            ),
          ),
          SizedBox(height: 60,),
          Center(
            child: Text('Welcome to geeks for geeks',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: handleSignOut,
              child: Text('Sign out')
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SizedBox(height: 90,),
          Center(
            child: Image.asset(''),
          ),
          SizedBox(height: 40,),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome to google Auth',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: 250,
              child: ElevatedButton(onPressed: handleSignIn,
                child:Padding(padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Image.asset('name'),
                    SizedBox(width: 20,),

                    Text('Google sign in')

                  ],
                ),
              ),),
            ),
          )

        ],
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        child: buildBody(),
      ),
    );
  }

}