import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcms/newstudent.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    const todayAttendance = 0;
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Welcome to TCMS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    )),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewStudentPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: Size(MediaQuery.of(context).size.width / 8,
                      MediaQuery.of(context).size.height / 4),
                ),
                child: Column(
                  children: const [
                    Text("Register"),
                    Text("New Student"),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: Size(MediaQuery.of(context).size.width / 8,
                      MediaQuery.of(context).size.height / 4),
                ),
                child: Column(
                  children: const [
                    Text('View'),
                    Text('Students List'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: Size(MediaQuery.of(context).size.width / 8,
                      MediaQuery.of(context).size.height / 4),
                ),
                child: Column(
                  children: [
                    const Text('Fees collected in'),
                    Text(
                      "'${DateFormat.MMMM().format(DateTime.now())}'",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: Size(MediaQuery.of(context).size.width / 8,
                        MediaQuery.of(context).size.height / 4),
                  ),
                  child: Column(
                    children: [
                      const Text('Admissions in'),
                      Text(
                        "'${DateFormat.MMMM().format(DateTime.now())}'",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: Size(MediaQuery.of(context).size.width / 8,
                        MediaQuery.of(context).size.height / 4),
                  ),
                  child: Column(
                    children: const [
                      Text("Today's Attendance"),
                      Text(
                        "$todayAttendance",
                        style: TextStyle(fontSize: 45),
                      ),
                    ],
                  )),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: Size(MediaQuery.of(context).size.width / 8,
                        MediaQuery.of(context).size.height / 4),
                  ),
                  child: Column(
                    children: const [
                      Text("Mark Attendance"),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
