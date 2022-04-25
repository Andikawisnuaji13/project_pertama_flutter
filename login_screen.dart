import 'package:flutter/material.dart';
import 'package:pertemuan5andika/SignUp_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          Expanded(
            child: Image.asset(
              'images/login.png',
              height: 500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: TextFormField(
              controller: userNameController,
              decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Silahkan Masukkan Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 30,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: TextFormField(
              obscureText: hidePass,
              controller: passwordController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon:
                      Icon(hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      hidePass = !hidePass;
                    });
                  },
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  size: 30,
                ),
                labelText: 'Password',
                hintText: 'Silahkan Masukkan Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  if (userNameController.text == "mol" &&
                      passwordController.text == "123") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('sukses login'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Usernama atau Password salah'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Sign In')),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SignUpScreen()),
                  );
                },
                child: Text(
                  'Tidak punya akun? Sign up',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
