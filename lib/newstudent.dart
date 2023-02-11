// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tcms/login.dart';
import 'package:tcms/studentprofile.dart';

// List<String> districtslist = [
//   "Select",
//   "Gampaha",
//   "Kandy",
//   "Colombo",
//   "Kalutara",
//   "Matale",
//   "Nuwara-Eliya",
// ];
// String districtselected = 'Select';

class NewStudentPage extends StatefulWidget {
  const NewStudentPage({super.key});

  @override
  State<NewStudentPage> createState() => _NewStudentPageState();
}

class _NewStudentPageState extends State<NewStudentPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String data = '';

  final _formKey = GlobalKey<FormState>();
  String _username = '';
  final String _email = '';
  final String _password = '';
  final String _district = '';
  final String _confirmpassword = '';
  // String districts = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Register a New Student",
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 23,
                      )),
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Name",
                    ),
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter student's name";
                      }
                      return null;
                    },
                    onSaved: (value) => _username = value!,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                    controller: _emailController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) => _username = value!,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Mobile Number",
                    ),
                    controller: _mobileController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty ||
                          value.length != 10 ||
                          !RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return "Please Enter student's Contact Number";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Address",
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  ElevatedButton(
                    child: const Text(
                      "Register new Student",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        if (_username == null ||
                            _password == null ||
                            _email == null ||
                            _district == null ||
                            _confirmpassword == null) {
                          // Show an error message to indicate that all fields are required.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please fill in all fields"),
                            ),
                          );
                        } else {
                          setState(() {
                            data = _nameController.text +
                                _emailController.text +
                                _mobileController.text;
                          });
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: QrImage(
                      data: '$data',
                      version: QrVersions.auto,
                      size: 250,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudentProfilePage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Go to student profile',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
