import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Patientlist extends StatefulWidget {
  Patientlist({Key? key}) : super(key: key);

  @override
  State<Patientlist> createState() => _PatientlistState();
}

class _PatientlistState extends State<Patientlist> {


List pat=['patient1','patient2','patient3','PATIENT4','pateitn5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.greenAccent,
          title: Text("Patientlist", style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          )
      ) ,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/patient1.jpg"),
                )),
            InkWell(
              onTap: () {
                print("hello");
              },
              child: Card(
                child: ListTile(
                  title: Text("About"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("hello");
              },
              child: Card(
                child: ListTile(
                  title: Text("Helpline"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("hello");
              },
              child: Card(
                child: ListTile(
                  title: Text("Settings"),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: pat.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.fromLTRB(5, 20, 5, 2),
            child: ListTile(
              onTap: () {
                print("ontap yash");
              },
              title: Text("${pat[index]}"),
            ),
          );
        },
        ),
      );
  }
}
