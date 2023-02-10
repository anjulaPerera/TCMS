import 'package:flutter/material.dart';
import 'package:tcms/login.dart';
import 'package:tcms/register.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = double.infinity;

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 10, right: 10),
            child: Container(
              width: screenWidth,
              height: MediaQuery.of(context).size.width * (8 / 11),
              // color: Colors.black,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/getStarted.png'),
                      fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'T C M S',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              minimumSize: const Size(250, 70),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              );
            },
            child: const Text(
              'Get Started',
              style: TextStyle(color: Colors.amber, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, top: 15),
            child: Row(
              children: [
                const Text(
                  'Already registered?  ',
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
