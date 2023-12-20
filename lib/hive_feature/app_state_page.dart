import 'package:firebase_flutter/feature/google%20login/google_login_page.dart';
import 'package:firebase_flutter/hive_feature/hive_data_source.dart';
import 'package:firebase_flutter/profile/profile_page.dart';
import 'package:flutter/material.dart';

class AppStateObserver extends StatefulWidget {
  const AppStateObserver({super.key});

  @override
  State<AppStateObserver> createState() => _AppStateObserverState();
}

class _AppStateObserverState extends State<AppStateObserver> {

  @override
  void initState() {
    checkStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome..',textScaleFactor: 2,),
      ),
    );
  }

  Future<void> checkStatus() async {

    var hive = HiveDataSource();

    var userFirstTime = await hive.isFirstInstalled();

    if(userFirstTime){
      print("PageA:");
      // hive.updateFirstInstalled(true);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => GoogleLoginPage()));
      // hive.updateFirstInstalled(false);

    }
    else{
      print("PageB");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage(userEmail: '', userName: '', userPhotoURL: '',)));
      // hive.updateFirstInstalled(false);
    }


  }
}
