

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // String? uid;


  // Future<User?> register(String email, String password, BuildContext context) async{
  //   // UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  //   // return userCredential.user;

  //   try {
  //     UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  //   return userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()), backgroundColor: Colors.red,));
  //   }catch(e){
  //     print(e);
  //   }
    
  // }

  Future<User?> login(String email, String password, BuildContext context)async{
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userId", userCredential.user!.uid);
    return userCredential.user;
    } on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()), backgroundColor: Colors.red,));
    }catch(e){
      print(e);
    }
    
  }


  Future signOut()async{
    await firebaseAuth.signOut();
  }

  // Future<User?> register(String email, String password, BuildContext context) async{
  //   // UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  //   // return userCredential.user;

  //   try {
  //     UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((credential) => {
  //       if(credential && credential.user){
  //         FirebaseFirestore.instance.collection('users').doc(credential.user.uid).set({
  //           email: email,
  //           password: password
  //         });
  //         history.push("/")
  //       }
  //     })
  //      .catch(error => alert(error.message));
  //   return userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()), backgroundColor: Colors.red,));
  //   }catch(e){
  //     print(e);
  //   }
    
  // }


// Future<User?> register(String email, String password, BuildContext context) async{}
//   register = e => {
//   e.preventDefault();

//   auth
//     .createUserWithEmailAndPassword(email, password)
//     .then(credential => {
//       if (credential && credential.user) {
//         db.collection("users")
//           .doc(credential.user.uid)
//           .set({
//             email: email,
//             password: password
//           });

//         history.push("/");
//       }
//     })
//     .catch(error => alert(error.message));
// };

  Future<User?> register(String email, String password,String username, BuildContext context) async{
    // UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    // return userCredential.user;

    try {
      CollectionReference reference =
        FirebaseFirestore.instance.collection("users");
    String uid = firebaseAuth.currentUser!.uid;
    reference.doc(uid).set({});
    Map<String, dynamic> userdata = {
      "username": username,
      "Email": email,
      "uid": uid
    };
      // UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    // return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()), backgroundColor: Colors.red,));
    }catch(e){
      print(e);
    }
    
  }

}
  
