import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Role/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Choose your role',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
          SizedBox(height: 30.0,), 
          Text('I am a Patient',style: TextStyle(fontSize: 20.0),),
          SizedBox(height: 15.0,), 
          Text('I am a Board Member',style: TextStyle(fontSize: 20.0),),
          SizedBox(height: 15.0,), 
          Text('I am a Doctor',style: TextStyle(fontSize: 20.0),),
          SizedBox(height: 15.0,), 
          Text('I am a staff',style: TextStyle(fontSize: 20.0),),
        ],
      ),
    );
  }
}