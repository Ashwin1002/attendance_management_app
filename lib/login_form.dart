import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

String? finalUsername;

class LoginScreen extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  bool isLoggedIn = false;

  final unameController = TextEditingController();
  final passController = TextEditingController();
  final compController = TextEditingController();
  String uname = "user";
  String pass = "password";
  String comp = "ES25";


  /*@override
  void initState() {
    loginUser().whenComplete(() async {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => finalUsername == null ? LoginScreen() : Home()));
    });
    super.initState();
  }*/

  Future loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var savedUsername = prefs.getString('username');
    setState(() {
      finalUsername = savedUsername;
    });
    print(finalUsername);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Attendance Management"),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage('assets/images/easy_software.png'),
                  width: 200,
                  height: 200,),
                const SizedBox(height: 20,),

                const Text('Easy Software', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: compController,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Company ID"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Company ID cannot be empty! ';
                      } else if (comp != compController.text){
                        return "Incorrect Company ID";
                      } else if (value.length < 2){
                        return "Company ID is too short";
                      } else if (value.length > 6){
                        return "Company ID is too long";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: unameController,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Username"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username cannot be empty! ';
                      }else if (uname != unameController.text){
                        return "Incorrect Username";
                      }else if (value.length < 2){
                        return "Username is too short";
                      } else if (value.length > 10){
                        return "Username is too long";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    controller: passController,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty! ';
                      }else if (pass != passController.text){
                        return "Incorrect Password";
                      }else if (value.length < 2){
                        return "Password is too short";
                      } else if (value.length > 10){
                        return "Password is too long";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      border: Border.all(width: 1, color: Colors.black)
                  ),
                  child: TextButton(
                      onPressed: () async{
                        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        sharedPreferences.setString('username', unameController.text);
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login Successful')),
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const Home()));
                        }
                      },
                      child: const Text('Login', style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                      ),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

