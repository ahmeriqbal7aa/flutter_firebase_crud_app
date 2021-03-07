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

  createData() {
    print('created');
  }

  readData() {
    print('read');
  }

  updateData() {
    print('update');
  }

  deleteData() {
    print('delete');
  }
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
                obscureText: true,
                decoration: textFieldInputDecoration(
                  'Student ID',
                  Icon(Icons.perm_identity_outlined),
                ),
                onChanged: (String studentID) {
                  getStudentID(studentID);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                style: simpleTextStyle(),
                obscureText: true,
                decoration: textFieldInputDecoration(
                  'Study Program ID',
                  Icon(Icons.perm_identity_outlined),
                ),
                onChanged: (String studyProgramID) {
                  getStudyProgramID(studyProgramID);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                style: simpleTextStyle(),
                obscureText: true,
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
