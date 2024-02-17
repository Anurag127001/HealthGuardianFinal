import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _variable = "-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.fill,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 7,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: Image.asset(
              'assets/images/loginicon.png', // Replace with the path to your login image
              width: 120.0,
              height: 120.0,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
            child: Text("Welcome to App",
                style: TextStyle(
                    height: 14,
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    fontFamily: "Roboto")),
          ),
          Positioned(
            top: 350,
            left: 20,
            right: 20,
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Username", hintText: "Enter username"),
            ),
          ),
          Positioned(
            top: 450,
            left: 20,
            right: 20,
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter Password",
              ),
            ),
          ),
          Positioned(
            top: 550,
            left: 20,
            right: 20,
            child: DropdownButtonFormField(
              value: _variable,
              items: [
                DropdownMenuItem(child: Text("Select authority"), value: "-1"),
                DropdownMenuItem(child: Text("Patient"), value: "1"),
                DropdownMenuItem(child: Text("Doctor"), value: "2"),
                DropdownMenuItem(child: Text("Regulatory body"), value: "3"),
              ],
              onChanged: (String? newValue) {
                setState(() {
               //  _variable = newValue;
                });
              },
            ),
          ),
       Positioned(
         top: 650,
         left: 160,
         child: ElevatedButton(
             onPressed: () {
               print("hello");
             },
             child: Text("login",
             )),
       )
         ],
      ),
    );
  }
}
