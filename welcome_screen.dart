import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pertemuan5andika/SignUp_Screen.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Welcome',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              )),
          Expanded(
            child: Image.asset(
              'images/gambarLogin.png',
              height: 500,
            ),
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
                child: Text('Login')),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SignUpScreen()),
                  );
                },
                child: Text('Sign Up')),
          ),
        ],
      ),
    );
  }
}
