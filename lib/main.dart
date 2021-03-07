import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud_app/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.amber[400],
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ====================================================== //
  String stdName, stdID, programID;
  double stdGPA;
  getStudentName(name) {
    this.stdName = name;
  }

  getStudentID(id) {
    this.stdID = id;
  }

  getStudyProgramID(pid) {
    this.programID = pid;
  }

  getStudentCGPA(result) {
    this.stdGPA = double.parse(result);
  }

  // TODO Create Data
  createData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('crud').doc(stdName);

    // create Map to send data in key:value pair form
    Map<String, dynamic> students = ({
      "studentName": stdName,
      "studentID": stdID,
      "studyProgramID": programID,
      "studentCGPA": stdGPA
    });

    // send data to Firebase
    documentReference
        .set(students)
        .whenComplete(() => print('$stdName created'));
  }

  // TODO Read Data
  readData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('crud').doc(stdName);

    documentReference.get().then((dataSnapshot) {
      print(dataSnapshot.data()["studentName"]);
      print(dataSnapshot.data()["studentID"]);
      print(dataSnapshot.data()["studyProgramID"]);
      print(dataSnapshot.data()["studentCGPA"]);
    });
  }

  // TODO Update Data
  updateData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('crud').doc(stdName);

    Map<String, dynamic> students = ({
      "studentName": stdName,
      "studentID": stdID,
      "studyProgramID": programID,
      "studentCGPA": stdGPA
    });

    // update data to Firebase
    documentReference
        .set(students)
        .whenComplete(() => print('$stdName updated'));
  }

  // TODO Delete Data
  deleteData() {}
  // ====================================================== //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CRUD App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                style: simpleTextStyle(),
                decoration: textFieldInputDecoration(
                  'Name',
                  Icon(Icons.account_circle_outlined),
                ),
                onChanged: (String name) {
                  setState(() {
                    getStudentName(name);
                  });
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                style: simpleTextStyle(),
                decoration: textFieldInputDecoration(
                  'Student ID',
                  Icon(Icons.perm_identity_outlined),
                ),
                onChanged: (String sID) {
                  getStudentID(sID);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                style: simpleTextStyle(),
                decoration: textFieldInputDecoration(
                  'Study Program ID',
                  Icon(Icons.perm_identity_outlined),
                ),
                onChanged: (String pID) {
                  getStudyProgramID(pID);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                style: simpleTextStyle(),
                decoration: textFieldInputDecoration(
                  'CGPA',
                  Icon(Icons.confirmation_number_outlined),
                ),
                onChanged: (String gpa) {
                  getStudentCGPA(gpa);
                },
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        createData();
                      },
                      color: Colors.green,
                      child: Text('Create',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      textColor: Colors.white,
                      shape: raisedButtonBorder(),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        readData();
                      },
                      color: Colors.blue,
                      child: Text('Read',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      textColor: Colors.white,
                      shape: raisedButtonBorder(),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        updateData();
                      },
                      color: Colors.orange,
                      child: Text('Update',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      textColor: Colors.white,
                      shape: raisedButtonBorder(),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        deleteData();
                      },
                      color: Colors.red,
                      child: Text('Delete',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      textColor: Colors.white,
                      shape: raisedButtonBorder(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
