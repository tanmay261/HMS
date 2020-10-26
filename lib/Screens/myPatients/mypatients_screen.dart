import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/myPatients/components/body.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/patients.dart';
import 'package:flutter_auth/services/patient_service.dart';

class MyPatientsScreen extends StatefulWidget {
  @override
  _MyPatientsScreenState createState() => _MyPatientsScreenState();
}

class _MyPatientsScreenState extends State<MyPatientsScreen> {
  var _patientName = TextEditingController();
  var _disease = TextEditingController();
  var _patient = Patients();
  var _patientservice = PatientService();

  @override
  void initState() {
    super.initState();
    getAllPatients();
  }

  getAllPatients() async {
    var patients = await _patientservice.getPatients();
    patients.forEach((patient) {
      print(patient['name']);
    });
  }

  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(
                onPressed: () async {
                  _patient.name = _patientName.text;
                  _patient.disease = _disease.text;
                  var result = await _patientservice.savePatient(_patient);
                  print(result);
                },
                child: Text('Save'),
              ),
              FlatButton(
                onPressed: null,
                child: Text('Cancel'),
              )
            ],
            title: Text('Patient Details'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _patientName,
                    decoration: InputDecoration(hintText: 'Name'),
                  ),
                  TextField(
                    controller: _disease,
                    decoration: InputDecoration(hintText: 'Disease'),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
      appBar: AppBar(
        title: Text('My Patients'),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text('Doctor'),
            accountName: Text('John Morreau'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: kPrimaryLightColor,
                child: Icon(
                  Icons.phone_android,
                  color: kPrimaryColor,
                  size: 30.0,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Appointments'),
            leading: Icon(Icons.notifications),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyPatientsScreen()));
            },
            title: Text('My Patients'),
            leading: Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text('Payments'),
            leading: Icon(Icons.payment),
          ),
          ListTile(
            title: Text('Equipment Status'),
            leading: Icon(Icons.shop),
          ),
        ],
      )),
    );
  }
}
