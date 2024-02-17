import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DecryptPatientData.dart';

class Patientpage extends StatelessWidget {
  const Patientpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCCCDCC),

      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: const Color(0xff2F2E40),
        title: Text(
          "Patient's Dashboard",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            textStyle: const TextStyle(color: Colors.white),
            fontSize: 25,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/patient1.jpg"),
                )),
            InkWell(
              onTap: () {
                
              },
              child: const Card(
                child: ListTile(
                  title: Text("About"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("hello");
              },
              child: const Card(
                child: ListTile(
                  title: Text("Helpline"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("hello");
              },
              child: const Card(
                child: ListTile(
                  title: Text("Settings"),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardItempatient('Checkups', 'assets/images/Checkups.png', () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return EnterPrescriptionDetails();
                //             },
                //   ),
                // );
                },),

                CardItempatient('Receipts', 'assets/images/Receipts.png', () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>AESDecryptionPage()));

                }),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardItempatient('Prescriptions', 'assets/images/Prescriptions.png', () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>AESDecryptionPage()));

              }),
              CardItempatient('Records', 'assets/images/Records.png', () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AESDecryptionPage()));

              }),
            ],
          ),

        ],
      ),
    );
  }
}

class CardItempatient extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;


  CardItempatient(this.title, this.imagePath, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 150.0,
              width: 165.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}