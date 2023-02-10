import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  @override
  Widget build(BuildContext context) {
    //get student name here
    final studentname = 'Anjula Perera';
    bool feespaid = false;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("$studentname",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    )),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              radius: 100,
              backgroundColor: Colors.amber,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
                radius: 98,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Fees for ${DateFormat.MMMM().format(DateTime.now())}  : ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: feespaid ? Colors.green : Colors.red,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
