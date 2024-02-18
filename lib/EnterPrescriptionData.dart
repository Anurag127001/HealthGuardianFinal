// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'aesAlgorithm.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class EnterPrescriptionDetails extends StatefulWidget {
//   @override
//   _EnterPrescriptionDetailsState createState() =>
//       _EnterPrescriptionDetailsState();
// }
//
// class _EnterPrescriptionDetailsState extends State<EnterPrescriptionDetails> {
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _contactNumberController =
//       TextEditingController();
//   final TextEditingController _patientIdController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _medicalHistoryController =
//       TextEditingController();
//
//   String? _selectedGender;
//   String? _selectedBloodGroup;
//
//   final List<String> genders = ['Male', 'Female', 'Other'];
//   final List<String> bloodGroups = [
//     'A+',
//     'A-',
//     'B+',
//     'B-',
//     'AB+',
//     'AB-',
//     'O+',
//     'O-'
//   ];
//
//   CollectionReference _encryptedDataCollection =
//       FirebaseFirestore.instance.collection('Patients');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white, //change your color here
//         ),
//         backgroundColor: const Color(0xff2F2E40),
//         title: Text(
//           "Enter Patient Details",
//           style: GoogleFonts.lato(
//             fontWeight: FontWeight.bold,
//             textStyle: const TextStyle(color: Colors.white),
//             fontSize: 25,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               _buildTextField(
//                 controller: _fullNameController,
//                 labelText: 'Full Name',
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 controller: _ageController,
//                 labelText: 'Age',
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 10),
//               _buildDropdownField(
//                 value: _selectedGender,
//                 items: genders.map((gender) {
//                   return DropdownMenuItem<String>(
//                     value: gender,
//                     child: Text(gender),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedGender = value;
//                   });
//                 },
//                 labelText: 'Gender',
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 controller: _contactNumberController,
//                 labelText: 'Contact Number',
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 controller: _patientIdController,
//                 labelText: 'Patient ID',
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 controller: _emailController,
//                 labelText: 'Email',
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 controller: _addressController,
//                 labelText: 'Address',
//               ),
//               const SizedBox(height: 10),
//               _buildDropdownField(
//                 value: _selectedBloodGroup,
//                 items: bloodGroups.map((bloodGroup) {
//                   return DropdownMenuItem<String>(
//                     value: bloodGroup,
//                     child: Text(bloodGroup),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedBloodGroup = value;
//                   });
//                 },
//                 labelText: 'Blood Group',
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 controller: _medicalHistoryController,
//                 labelText: 'Aadhar Number',
//                 maxLines: 5,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xff2F2E40),
//                     foregroundColor: Colors.white),
//                 onPressed: () async {
//                   await _encryptData();
//                   await _createFirebaseUser();
//                 },
//                 child: const Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _encryptData() async {
//     String fullName = _fullNameController.text;
//     int age = int.tryParse(_ageController.text) ?? 0;
//     int contactNumber = int.tryParse(_contactNumberController.text) ?? 0;
//     String patientId = _patientIdController.text;
//     String email = _emailController.text;
//     String address = _addressController.text;
//     String medicalHistory = _medicalHistoryController.text;
//
//     // Encrypting data
//     String encryptedFullName = AESAlgorithm.encryptData(fullName);
//     String encryptedAddress = AESAlgorithm.encryptData(address);
//     String encryptedMedicalHistory = AESAlgorithm.encryptData(medicalHistory);
//     String encryptedContactNumber =
//         AESAlgorithm.encryptData(contactNumber.toString());
//     String encryptedAge = AESAlgorithm.encryptData(age.toString());
//
//     // Storing encrypted data in Firestore
//     await _storeEncryptedData(
//       email,
//       {
//         'Full Name': encryptedFullName,
//         'Age': encryptedAge,
//         'Gender': _selectedGender ?? '',
//         'Contact Number': encryptedContactNumber,
//         'Patient ID': patientId,
//         'Email': email,
//         'Address': encryptedAddress,
//         'Blood Group': _selectedBloodGroup ?? '',
//         'Medical History': encryptedMedicalHistory,
//       },
//     );
//   }
//
//   Future<void> _storeEncryptedData(String email, Map<String, dynamic> encryptedData) async {
//     await _encryptedDataCollection.doc(email).set(encryptedData);
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//       content: Text('Data encrypted and saved successfully!'),
//     ));
//   }
//
//   Future<void> _createFirebaseUser() async {
//     try {
//       String email = _emailController.text;
//       String password = _patientIdController.text;
//
//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       print('User created: ${userCredential.user!.uid}');
//     } catch (e) {
//       print('Error creating user: $e');
//       // Handle the error as needed
//     }
//   }
// }
//
// Widget _buildTextField({
//   required TextEditingController controller,
//   required String labelText,
//   TextInputType keyboardType = TextInputType.text,
//   int maxLines = 1,
// }) {
//   return TextFormField(
//     controller: controller,
//     keyboardType: keyboardType,
//     maxLines: maxLines,
//     style: const TextStyle(color: Colors.black),
//     decoration: InputDecoration(
//       labelText: labelText,
//       border: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey),
//       ),
//       focusedBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.blue),
//       ),
//       enabledBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey),
//       ),
//       errorBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.red),
//       ),
//       focusedErrorBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.red),
//       ),
//     ),
//   );
// }
//
// Widget _buildDropdownField({
//   required String? value,
//   required List<DropdownMenuItem<String>> items,
//   required String labelText,
//   required void Function(String?)? onChanged,
// }) {
//   return DropdownButtonFormField<String>(
//     value: value,
//     items: items,
//     onChanged: onChanged,
//     decoration: InputDecoration(
//       labelText: labelText,
//       border: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey),
//       ),
//       focusedBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.blue),
//       ),
//     ),
//   );
// }



// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'aesAlgorithm.dart';
//
// class AESEncryptionPage extends StatefulWidget {
//   @override
//   _AESEncryptionPageState createState() => _AESEncryptionPageState();
// }
//
// class _AESEncryptionPageState extends State<AESEncryptionPage> {
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   final TextEditingController _contactNumberController = TextEditingController();
//   final TextEditingController _patientIdController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _bloodGroupController = TextEditingController();
//   final TextEditingController _medicalHistoryController = TextEditingController();
//
//   CollectionReference _encryptedDataCollection =
//   FirebaseFirestore.instance.collection('Patients');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.greenAccent,
//         title: Text('Enter Patient Details'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _fullNameController,
//                 decoration: InputDecoration(labelText: 'Full Name'),
//               ),
//               TextFormField(
//                 controller: _ageController,
//                 decoration: InputDecoration(labelText: 'Age'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextFormField(
//                 controller: _genderController,
//                 decoration: InputDecoration(labelText: 'Gender'),
//               ),
//               TextFormField(
//                 controller: _contactNumberController,
//                 decoration: InputDecoration(labelText: 'Contact Number'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextFormField(
//                 controller: _patientIdController,
//                 decoration: InputDecoration(labelText: 'Patient ID'),
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               TextFormField(
//                 controller: _addressController,
//                 decoration: InputDecoration(labelText: 'Address'),
//               ),
//               TextFormField(
//                 controller: _bloodGroupController,
//                 decoration: InputDecoration(labelText: 'Blood Group'),
//               ),
//               TextFormField(
//                 controller: _medicalHistoryController,
//                 decoration: InputDecoration(labelText: 'Aadhar Number'),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor:
//                     MaterialStatePropertyAll(Colors.lightBlueAccent)),
//                 onPressed: () async {
//                   await _encryptData();
//                   await _createFirebaseUser();
//                 },
//                 child: Text('Encrypt and Save',
//                     style: TextStyle(color: Colors.black)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _encryptData() async {
//     String fullName = _fullNameController.text;
//     int age = int.tryParse(_ageController.text) ?? 0;
//     String gender = _genderController.text;
//     int contactNumber =
//         int.tryParse(_contactNumberController.text) ?? 0;
//     String patientId = _patientIdController.text;
//     String email = _emailController.text;
//     String address = _addressController.text;
//     String bloodGroup = _bloodGroupController.text;
//     String medicalHistory = _medicalHistoryController.text;
//     String aadharNumber = _medicalHistoryController.text;
//
//     // Encrypting data
//     String encryptedFullName = AESAlgorithm.encryptData(fullName);
//     String encryptedGender = AESAlgorithm.encryptData(gender);
//     String encryptedAddress = AESAlgorithm.encryptData(address);
//     String encryptedBloodGroup = AESAlgorithm.encryptData(bloodGroup);
//     String encryptedMedicalHistory =
//     AESAlgorithm.encryptData(medicalHistory);
//     String encryptedContactNumber =
//     AESAlgorithm.encryptData(contactNumber.toString());
//     String encryptedAge = AESAlgorithm.encryptData(age.toString());
//
//     // Check if Aadhar Number already exists
//     bool userExists = await _checkUserExists(aadharNumber);
//     if (userExists) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('User already exists!'),
//       ));
//       return;
//     }
//
//     // Storing encrypted data in Firestore
//     await _storeEncryptedData(
//       email,
//       {
//         'Full Name': encryptedFullName,
//         'Age': encryptedAge,
//         'Gender': encryptedGender,
//         'Contact Number': encryptedContactNumber,
//         'Patient ID': patientId, // Storing Patient ID without encryption
//         'Email': email, // Storing Email as it is
//         'Address': encryptedAddress,
//         'Blood Group': encryptedBloodGroup,
//         'Medical History': encryptedMedicalHistory,
//         'Aadhar Number': aadharNumber, // Storing Aadhar Number without encryption
//       },
//     );
//   }
//
//   Future<void> _storeEncryptedData(
//       String email, Map<String, dynamic> encryptedData) async {
//     await _encryptedDataCollection.doc(email).set(encryptedData);
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Data encrypted and saved successfully!'),
//     ));
//   }
//
//   Future<void> _createFirebaseUser() async {
//     try {
//       String email = _emailController.text;
//       String password = _patientIdController.text;
//
//       UserCredential userCredential =
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       print('User created: ${userCredential.user!.uid}');
//     } catch (e) {
//       print('Error creating user: $e');
//       // Handle the error as needed
//     }
//   }
//
//   Future<bool> _checkUserExists(String aadharNumber) async {
//     QuerySnapshot querySnapshot = await _encryptedDataCollection
//         .where('Aadhar Number', isEqualTo: aadharNumber)
//         .get();
//     return querySnapshot.docs.isNotEmpty;
//   }
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'aesAlgorithm.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterPrescriptionDetails extends StatefulWidget {
  @override
  _EnterPrescriptionDetailsState createState() => _EnterPrescriptionDetailsState();
}

class _EnterPrescriptionDetailsState extends State<EnterPrescriptionDetails> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _aadharNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _medicalHistoryController = TextEditingController();

  CollectionReference _patientsCollection =
  FirebaseFirestore.instance.collection('Patients');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: const Color(0xff2F2E40),
        title: Text(
          "Enter Patient Details",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            textStyle: const TextStyle(color: Colors.white),
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                controller: _contactNumberController,
                decoration: InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _aadharNumberController,
                decoration: InputDecoration(labelText: 'Aadhar Number'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: _bloodGroupController,
                decoration: InputDecoration(labelText: 'Blood Group'),
              ),
              TextFormField(
                controller: _medicalHistoryController,
                decoration: InputDecoration(labelText: 'Medical History'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2F2E40),
                foregroundColor: Colors.white),
                onPressed: () async {
                  await _checkAndSubmitData();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _checkAndSubmitData() async {
    String fullName = _fullNameController.text;
    int age = int.tryParse(_ageController.text) ?? 0;
    String gender = _genderController.text;
    int contactNumber =
        int.tryParse(_contactNumberController.text) ?? 0;
    String aadharNumber = _aadharNumberController.text;
    String email = _emailController.text;
    String address = _addressController.text;
    String bloodGroup = _bloodGroupController.text;
    String medicalHistory = _medicalHistoryController.text;

    bool isAadharNumberExists = await _checkAadharNumberExists(aadharNumber);
    if (isAadharNumberExists) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('User with this Aadhar Number already exists!'),
      ));
      return;
    }

    // Encrypting data
    String encryptedFullName = AESAlgorithm.encryptData(fullName);
    String encryptedGender = AESAlgorithm.encryptData(gender);
    String encryptedAddress = AESAlgorithm.encryptData(address);
    String encryptedBloodGroup = AESAlgorithm.encryptData(bloodGroup);
    String encryptedMedicalHistory =
    AESAlgorithm.encryptData(medicalHistory);
    String encryptedContactNumber =
    AESAlgorithm.encryptData(contactNumber.toString());
    String encryptedAge = AESAlgorithm.encryptData(age.toString());

    // Storing encrypted data in Firestore
    await _storeEncryptedData(email, aadharNumber, {
      'Full Name': encryptedFullName,
      'Age': encryptedAge,
      'Gender': encryptedGender,
      'Contact Number': encryptedContactNumber,
      'Aadhar Number': aadharNumber, // Storing Aadhar Number as it is
      'Email': email,
      'Address': encryptedAddress,
      'Blood Group': encryptedBloodGroup,
      'Medical History': encryptedMedicalHistory,
    });
  }

  Future<bool> _checkAadharNumberExists(String aadharNumber) async {
    QuerySnapshot querySnapshot = await _patientsCollection
        .where('Aadhar Number', isEqualTo: aadharNumber)
        .limit(1)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> _storeEncryptedData(
      String email, String aadharNumber, Map<String, dynamic> encryptedData) async {
    await _patientsCollection.doc(email).set(encryptedData);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Data encrypted and saved successfully!'),
    ));
  }
}
