// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:tcms/login.dart';

List<String> districtslist = [
  "Select",
  "Gampaha",
  "Kandy",
  "Colombo",
  "Kalutara",
  "Matale",
  "Nuwara-Eliya",
];
String districtselected = 'Select';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  final String _email = '';
  String _password = '';
  final String _district = '';
  String _confirmpassword = '';
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
                  child: Text("Register",
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
                      labelText: "Username",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your username";
                      }
                      return null;
                    },
                    onSaved: (value) => _username = value!,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
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
                      labelText: "Password",
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Confirm Password";
                      }
                      return null;
                    },
                    onSaved: (value) => _confirmpassword = value!,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DropdownButton<String>(
                    onChanged: (String? newValue) {
                      setState(() {
                        districtselected = newValue!;
                        // district = districtselected;
                      });
                    },
                    //value: dropdownValue,
                    value: districtselected,
                    style: const TextStyle(color: Colors.black54, fontSize: 17),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black54,
                      size: 40,
                    ),
                    dropdownColor: Colors.amber,
                    items: districtslist
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    child: const Text(
                      "Register",
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
                        } else if (_password != _confirmpassword) {
                          // Show an error message to indicate that the passwords don't match.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Passwords don't match"),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, top: 15),
                    child: Row(
                      children: [
                        const Text('Already registered?  '),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.amber,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
