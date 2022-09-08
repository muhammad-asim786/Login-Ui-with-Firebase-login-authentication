import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registration2/auth_controller.dart';
import '../login_system/login_screen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var emailController = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: (){
                Get.to(()=>SignInPage());
              },
              child: Icon(Icons.arrow_back_ios_new,color: Colors.redAccent,)),
          Container(
            margin: EdgeInsets.only(top: 90,left: 20,right: 20),
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
          SizedBox(height: 80,),
          Center(
            child: Container(
              height: 60.0,
              width: 250,
              decoration: BoxDecoration(
                color: Color(0xFF89dad0),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(child: GestureDetector(
                  onTap: (){
                    print("forgot password");
                    AuthController.instance.forgotPassword(emailController.text.trim());
                  },
                  child: Center(child: Text('Forgot Your password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)))),
            ),
          ),
        ],
      ),
    );
  }
}
