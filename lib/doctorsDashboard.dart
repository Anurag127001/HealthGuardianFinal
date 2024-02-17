import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'EnterPrescriptionData.dart';
import 'carditem.dart';
import 'WritePrescriptionPage.dart';

class Doctorpage extends StatelessWidget {
  const Doctorpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCCCDCC),

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: const Color(0xff2F2E40),
        title: Text(
          "Doctor's Dashboard",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            textStyle: TextStyle(color: Colors.white),
            fontSize: 25,
          ),
        ),
      ),
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardItem('Add Patients', 'assets/images/AddPatients.png', () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EnterPrescriptionDetails();
                }));
              }),

              CardItem('View Patients', 'assets/images/ViewPatients.png', () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WritePrescriptionPage()));

              }),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //
          //     CardItem('Data Analytics', 'assets/images/DataAnalytics.png', () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => DetailScreen('DataAnalytics')),
          //       );
          //     }),
          //
          //   ],
          // ),
        ],
      ),
    );
  }
}
