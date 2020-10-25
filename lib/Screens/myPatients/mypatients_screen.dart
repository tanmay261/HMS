import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/myPatients/components/body.dart';

class MyPatientsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        title: Text('My Patients'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            Drawer(child: Column(
              children: [Text('Appointments'),
              Text('My Patients'),
              Text('Payments'),
              Text('Equipment Status'),],
            ));
          },
        ),
      ),
    );
  }
}
