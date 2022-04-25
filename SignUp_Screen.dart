import 'package:flutter/material.dart';
import 'package:pertemuan5andika/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
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
          Text('Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          Expanded(
            child: Image.asset(
              'images/signup.png',
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
                        content: Text('Username atau Password salah'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Sign Up')),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
                child: Text(
                  'Sudah Punya Akun? Sign In',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
                '------------------------------Atau------------------------------'),
          ),
          _buildSocialBtnRow(),
        ],
      ),
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              'images/fb.png',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'images/gg.jpg',
            ),
          ),
          _buildSocialBtn(
            () => print('login with Twitter'),
            AssetImage(
              'images/tw.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
