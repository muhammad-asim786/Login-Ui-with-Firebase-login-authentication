// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:registration2/auth_controller.dart';
import '../widgets/clip_path_class.dart';
import '../widgets/small_text.dart';
import 'login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          // for ClipperContainer**********************
             ClipPath(
              clipper: Customshape(),
              child: Container(
                height: 235,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF89dad0),
                ),
            ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // for picture**********************
                Container(
                  margin: EdgeInsets.only(top: 30),
                  // for picture**********************
                  child: Center(
                    child: Container(
                      height: 170.0,
                      width: 170.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/3.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // for email**********************
                Container(
                  padding: EdgeInsets.all(5),
                  height:60,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1.0,
                        blurRadius: 25,
                        offset: Offset(4, 10), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey[800],fontSize: 20),
                          prefixIcon: Icon(Icons.email,color: Color(0xFF89dad0),size: 20,),
                          hintText: "Email",
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // for password**********************
                Container(
                  padding: EdgeInsets.all(5),
                  height:60,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1.0,
                        blurRadius: 25,
                        offset: Offset(4, 10), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey[800],fontSize: 20),
                          prefixIcon: Icon(Icons.password,color: Color(0xFF89dad0),size: 20,),
                          hintText: "Password",
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  height:60,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1.0,
                        blurRadius: 25,
                        offset: Offset(4, 10), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey[800],fontSize: 20),
                          prefixIcon: Icon(Icons.person,color: Color(0xFF89dad0),size: 20,),
                          hintText: "Name",
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 10.0,
                ),
                // for signUp container**********************
                GestureDetector(
                  onTap: ()async{
                    AuthController.instance.register(emailController.text.trim(), passwordController.text.trim(),nameController.text.trim());
                   Map<String,dynamic> data = {
                     "email": emailController.text,
                     "password": passwordController.text,
                     "name": nameController.text,
                   };
                   FirebaseFirestore.instance.collection("users").add(data);
                  },
                  child: Center(
                    child: Container(
                      height: 60.0,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Color(0xFF89dad0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(child: Text('Sing up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // for have an account**********************
                Center(
                    child: SmallText(
                      text: 'Have an account?',
                      size: 20,
                    )),
                SizedBox(
                  height: 30,
                ),
                // for sign up one of the following**********************
                Center(
                    child: SmallText(
                      text: 'Sign up using one of the following methods',
                      size: 15,
                      color: Colors.black45,
                    )),
                SizedBox(height: 15,),
                // for Chose one of them google, facebook, twitter**********************
                Container(
                  margin: EdgeInsets.only(left: 75,right: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CircleAvatar(
                        radius: 20,
                          backgroundImage: AssetImage('assets/gggg.png')
                      ),
                      CircleAvatar(
                        radius: 20,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/tttt.png')
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/ffff.png')),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                GestureDetector(
                    onTap: (){
                      Get.to(()=>SignInPage());
                    },
                    child: Center(child: Text('Back to login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))),
              ],
            ),
          ),
          Positioned(
            top: 755,
            child: ClipPath(
              clipper: WaveClipperOne(reverse: true),
              child: Container(
                height: 120,
                width: 400,
                color: Color(0xFF89dad0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}