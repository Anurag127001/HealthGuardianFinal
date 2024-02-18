import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sampleandro/doctorsDashboard.dart';
import 'package:sampleandro/patientsDashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'carditem.dart';

class UserTypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2F2E40),
        title: Center(
          child: Text(
            "Select User",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              textStyle: TextStyle(color: Colors.white),
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardItem('Patient', 'assets/images/Patients.png', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PatientLoginPage()),
              );
            }),
            SizedBox(height: 70.0),
            CardItem('Doctor', 'assets/images/Doctors.png', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorLoginPage()),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class PatientLoginPage extends StatelessWidget {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPatientIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: const Color(0xff2F2E40),
        title: Text(
          "Patient Login",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            textStyle: TextStyle(color: Colors.white),
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: loginEmailController,
              decoration: InputDecoration(
                labelText: "Patient's Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              controller: loginPatientIdController,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff2F2E40),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                login(context, 'Patients', loginEmailController.text, loginPatientIdController.text);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void login(BuildContext context, String collection, String email, String patientId) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection(collection)
          .where('Email', isEqualTo: email)
          .where('Aadhar Number', isEqualTo: patientId)
          .get();

      if (result.docs.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Patientpage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid email or password. Please try again.'),
        ));
      }
    } catch (e) {
      print('Error during login: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred during login. Please try again later.'),
      ));
    }
  }
}

class DoctorLoginPage extends StatelessWidget {
  final TextEditingController loginNameController = TextEditingController();
  final TextEditingController loginUidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: const Color(0xff2F2E40),
        title: Text(
          "Doctor's Login",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            textStyle: TextStyle(color: Colors.white),
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: loginNameController,
              decoration: InputDecoration(
                labelText: "Doctor's Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              controller: loginUidController,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff2F2E40),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                login(context, 'Doctors', loginNameController.text, loginUidController.text);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void login(BuildContext context, String collection, String name, String uid) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection(collection)
          .where('Name', isEqualTo: name)
          .where('UID', isEqualTo: uid)
          .get();

      if (result.docs.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Doctorpage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid name or password. Please try again.'),
        ));
      }
    } catch (e) {
      print('Error during login: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred during login. Please try again later.'),
      ));
    }
  }
}

class HomeScreen extends StatelessWidget {
  final String userType;

  HomeScreen({required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen - $userType'),
      ),
      body: Center(
        child: Text('Welcome to the Home Screen, $userType!'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserTypeSelectionPage(),
  ));
}