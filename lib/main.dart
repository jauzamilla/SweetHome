import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sweethome/PercobaanFull/homeScreen.dart';
import 'package:sweethome/PercobaanFull/register.dart';
import 'package:sweethome/screen/halamanadmin/navbar_admin.dart';
import 'package:sweethome/screen/halamanuser/halamanhome.dart';
import 'package:sweethome/screen/pembuka/mulai.dart';
import 'package:sweethome/screen/pembuka/navbar.dart';
import 'package:sweethome/screen/pembuka/registrasi.dart';
import 'package:sweethome/screen/pembuka/splashscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sweethome/services/auth_services.dart';


Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      // StreamBuilder( stream: AuthServices().firebaseAuth.authStateChanges(),
      //   builder: (context,AsyncSnapshot snapshot) {
      //     if (snapshot.hasData) {
      //       return HomeScreen1(snapshot.data);
      //     } else {
      //       return RegistrasiScreen();
      //     }
      //   },
      // ),
       StreamBuilder( stream: AuthServices().firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavBar();
          } else {
            return SplashScreen();
          }
        },
      ),
      // SplashScreen(),
      
    );
  }
}