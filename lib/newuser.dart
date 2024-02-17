// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Newuser extends StatefulWidget {
//   Newuser({super.key});
//
//   @override
//   State<Newuser> createState() => _NewuserState();
// }
//
//
// class _NewuserState extends State<Newuser> {
//
//   // List patientdetails = [
//   //   'Full Name',
//   //   'Age',
//   //   'Gender',
//   //   'Contact Number',
//   //   'Patient Id',
//   //   'Email',
//   //   'Address',
//   //   'Blood Group',
//   //   'Medical History',
//   // ];
//
//   TextEditingController fullNameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController genderController = TextEditingController();
//   TextEditingController contactNumberController = TextEditingController();
//   TextEditingController patientIdController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController bloodGroupController = TextEditingController();
//   TextEditingController medicalHistoryController = TextEditingController();
//
//
//
//   addUserDetails(
//       String fullName,
//       // int age,
//       // String gender,
//       // int contactNumber,
//       // String patientId,
//       String email,
//       // String address,
//       // String bloodGroup,
//       // String medicalHistory
//         ) async {
//     FirebaseFirestore.instance.collection('Patients').add({
//       'name': fullName,
//       // 'Age': age,
//       // 'Gender': gender,
//       // 'Contact Number': contactNumber,
//       // 'Patient Id': patientId,
//       'Email': email,
//       // 'Address': address,
//       // 'Blood Group': bloodGroup,
//       // 'Medical History': medicalHistory,
//     });
//   }
//
//   // void dispose() {
//   //   fullNameController.dispose();
//   //   addressController.dispose();
//   //   ageController.dispose();
//   //   genderController.dispose();
//   //   contactNumberController.dispose();
//   //   patientIdController.dispose();
//   //   emailController.dispose();
//   //   bloodGroupController.dispose();
//   //   medicalHistoryController.dispose();
//   //   super.dispose();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Material(
//         child: Container(
//           decoration: BoxDecoration(color: Colors.greenAccent.shade100),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 25),
//                   child: Text("Enter Patient Details",
//                       style:
//                           TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 7),
//                   height: 3,
//                   width: 300,
//                   decoration: BoxDecoration(color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//
//                 // getting patient data
//                 Card(
//                   elevation: 3,
//                   child: Container(
//                     padding: EdgeInsets.only(left: 15),
//                     width: 380,
//                     margin: EdgeInsets.only(top: 20),
//                     child: TextFormField(
//                       controller: fullNameController,
//                       decoration: InputDecoration(hintText: "Full Name"),
//                     ),
//                   ),
//                 ),
// /*
//                 Card(
//                   elevation: 3,
//                   child: Container(
//                     padding: EdgeInsets.only(left: 15),
//                     width: 380,
//                     margin: EdgeInsets.only(top: 20),
//                     child: TextFormField(
//                       controller: ageController,
//                       decoration: InputDecoration(hintText: "Age"),
//                     ),
//                   ),
//                 ),
//
//                 Card(
//                   elevation: 3,
//                   child: Container(
//                     padding: EdgeInsets.only(left: 15),
//                     width: 380,
//                     margin: EdgeInsets.only(top: 20),
//                     child: TextFormField(
//                       controller: genderController,
//                       decoration: InputDecoration(hintText: "Gender"),
//                     ),
//                   ),
//                 ),
//
//                 Card(
//                   elevation: 3,
//                   child: Container(
//                     padding: EdgeInsets.only(left: 15),
//                     width: 380,
//                     margin: EdgeInsets.only(top: 20),
//                     child: TextFormField(
//                       controller: contactNumberController,
//                       decoration: InputDecoration(hintText: "Contact Number"),
//                     ),
//                   ),
//                 ),
//
//                 Card(
//                   elevation: 3,
//                   child: Container(
//                     padding: EdgeInsets.only(left: 15),
//                     width: 380,
//                     margin: EdgeInsets.only(top: 20),
//                     child: TextFormField(
//                       controller: patientIdController,
//                       decoration: InputDecoration(hintText: "Patient Id"),
//                     ),
//                   ),
//                 ),
// */
//                 Card(
//                   elevation: 3,
//                   child: Container(
//                     padding: EdgeInsets.only(left: 15),
//                     width: 380,
//                     margin: EdgeInsets.only(top: 20),
//                     child: TextFormField(
//                       controller: emailController,
//                       decoration: InputDecoration(hintText: "Email"),
//                     ),
//                   ),
//                 ),
// /*
//                 Card(
//                   elevation: 3,
//                   child: Container(
//                     padding: EdgeInsets.only(left: 15),
//                     width: 380,
//                     margin: EdgeInsets.only(top: 20),
//                     child: TextFormField(
//                       controller: addressController,
//                       decoration: InputDecoration(hintText: "Address"),
//                     ),
//                   ),
//                 ),
//
//                 Card(
//                   elevation: 3,
//                   child: Container(
//                     padding: EdgeInsets.only(left: 15),
//                     width: 380,
//                     margin: EdgeInsets.only(top: 20),
//                     child: TextFormField(
//                       controller: bloodGroupController,
//                       decoration: InputDecoration(hintText: "Blood Group"),
//                     ),
//                   ),
//                 ),
//
//                 Card(
//                   elevation: 3,
//                   child: Container(
//                     padding: EdgeInsets.only(left: 15),
//                     width: 380,
//                     margin: EdgeInsets.only(top: 20),
//                     child: TextFormField(
//                       controller: medicalHistoryController,
//                       decoration: InputDecoration(hintText: "Medical History"),
//                     ),
//                   ),
//                 ),
// */
//                 SizedBox(
//                   height: 20,
//                 ),
//
//                 ElevatedButton(
//                     onPressed: () {
//                       /*addUserDetails(
//                         fullNameController.text.trim(),
//                         int.parse(ageController.text.trim()),
//                         genderController.text.trim(),
//                         int.parse(contactNumberController.text.trim()),
//                         patientIdController.text.trim(),
//                         emailController.text.trim(),
//                         addressController.text.trim(),
//                         bloodGroupController.text.trim(),
//                         medicalHistoryController.text.trim(),
//                       );
//                       */
//                       CollectionReference collRef = FirebaseFirestore.instance.collection('Patients');
//                       collRef.add({
//                         'name': fullNameController.text,
//                         'email' : emailController.text
//                       }
//                       );
//                     },
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(Colors.lightBlueAccent)),
//                     child: Text("Add Patients"))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
