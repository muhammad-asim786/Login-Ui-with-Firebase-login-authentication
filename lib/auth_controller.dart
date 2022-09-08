

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';
import 'login_system/login_screen.dart';
class AuthController extends GetxController{
  //AuthController.intsance..
  static AuthController instance = Get.find();
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user==null){
      print("login page");
      Get.to(()=>SignInPage());
    }else{
      Get.to(()=>HomeScreen());
    }
  }

  void register(String email, password,String name)async{
    try{
      await  auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
              e.toString(),
              style: TextStyle(
                  color: Colors.white
              )
          )
      );
    }
  }
  void login(String email, password)async{
    try{
      await  auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login failed",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
              e.toString(),
              style: const TextStyle(
                  color: Colors.white
              )
          )
      );
    }
  }
  void logOut()async{
    await auth.signOut();
  }
  void forgotPassword(String email)async{
    await auth.sendPasswordResetEmail(email: email);
    Get.to(()=>SignInPage());
  }
}