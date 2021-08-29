import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud_app/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber[500],
      ),
    ),
  );
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
        .update(students)
        .whenComplete(() => print('$stdName updated'));
  }

  // TODO Delete Data
  deleteData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('crud').doc(stdName);

    // delete data from Firebase
    documentReference.delete().whenComplete(() => print('$stdName deleted'));
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
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      elevation: 8.0,
                      onPressed: () => createData(),
                      color: Colors.green,
                      child: Text('Create',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      textColor: Colors.white,
                      shape: raisedButtonBorder(),
                    ),
                  ),
                  Expanded(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      elevation: 8.0,
                      onPressed: () => readData(),
                      color: Colors.blue,
                      child: Text('Read',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      textColor: Colors.white,
                      shape: raisedButtonBorder(),
                    ),
                  ),
                  Expanded(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      elevation: 8.0,
                      onPressed: () => updateData(),
                      color: Colors.orange,
                      child: Text('Update',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      textColor: Colors.white,
                      shape: raisedButtonBorder(),
                    ),
                  ),
                  Expanded(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      elevation: 8.0,
                      onPressed: () => deleteData(),
                      color: Colors.red,
                      child: Text('Delete',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      textColor: Colors.white,
                      shape: raisedButtonBorder(),
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1.0, height: 25.0, color: Colors.green),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Student ID',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Program ID',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'CGPA',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('crud').snapshots(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data.docs[index];
                        return Row(
                          children: [
                            Expanded(
                              child: Text(
                                documentSnapshot["studentName"],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                documentSnapshot["studentID"],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                documentSnapshot["studyProgramID"],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                documentSnapshot["studentCGPA"].toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
