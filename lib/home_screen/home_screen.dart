import 'package:flutter/material.dart';
import 'package:registration2/auth_controller.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: Text("wecome to home page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        ),
          Center(child:
            RawMaterialButton(
              child: Text('Sign out'),
              onPressed: (){
                AuthController.instance.logOut();
            },),)
      ],),
    );
  }
}
