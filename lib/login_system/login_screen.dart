// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:registration2/auth_controller.dart';
import 'package:registration2/login_system/sign_up.dart';

import '../forgot_password/forgot_password.dart';
import '../widgets/clip_path_class.dart';
import '../widgets/small_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build');
    var emailController = TextEditingController();
    var paswordController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: Customshape(),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF89dad0),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  // for picture**********************
                  child: Center(
                    child: Container(
                      height: 180.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/3.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // for Hello**********************
                Text(
                  'Hello',
                  style: GoogleFonts.caladea(fontStyle: FontStyle.values.first,fontSize: 60,fontWeight: FontWeight.bold),
                ),
                // for sign into your account**********************
                SmallText(
                  text: 'Sign into your account',
                  size: 20,
                ),
                SizedBox(
                  height: 60,
                ),
                // for Phone**********************
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
                SizedBox(height: 20,),
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
                      obscureText: true,
                      controller: paswordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey[800],fontSize: 20),
                          prefixIcon: Icon(Icons.password,color: Color(0xFF89dad0),size: 20,),
                          hintText: "Pssword",
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                // for sign into your account**********************
                Container(
                    margin: EdgeInsets.only(left: 130),
                    child: SmallText(text: 'sign into your account',size: 20,)),
                SizedBox(height: 50,),
                // for Sign in container**********************
                Center(
                  child: Container(
                    height: 60.0,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Color(0xFF89dad0),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(child: GestureDetector(
                        onTap: (){
                          AuthController.instance.login(emailController.text.trim(), paswordController.text.trim());
                        },
                        child: Text('Sing In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),))),
                  ),
                ),
                SizedBox(height: 20,),
                // for Don't have an account**********************
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(text: 'Don\'t have an account?',size: 20,),
                    SizedBox(width: 9,),
                    GestureDetector(
                        onTap: (){
                          Get.to(()=>SignUpPage());
                        },
                        child: Text('Create',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 735,
            child: ClipPath(
              clipper: WaveClipperOne(reverse: true),
              child: Container(
                height: 120,
                width: 400,
                color: Color(0xFF89dad0),
              ),
            ),
          ),
          Positioned(
            top: 785,
            left: 0,
            right: 0,
            child: GestureDetector(
                onTap: (){
                  Get.to(()=>ForgotPassword());
                },
                child: Center(child: Text('Forgot Your Password',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))),
          )
        ],
      ),
    );
  }
}
