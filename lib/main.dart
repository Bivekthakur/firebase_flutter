import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter/firebase_message.dart';
import 'package:firebase_flutter/firebase_options.dart';
import 'package:firebase_flutter/hive_feature/app_state_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'feature/google login/google_login_page.dart';


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();


 try{
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
   );
 } catch(e){
   print("Error initalizing firebase: $e");

 }

  initializeNotification();

  runApp(const MyApp());
}
// number 1 notification
void initializeNotification(){

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  AppStateObserver(),
    );
  }
}