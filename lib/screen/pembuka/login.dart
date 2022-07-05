import 'dart:ui';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweethome/screen/pembuka/registrasi.dart';
import 'navbar.dart';
import 'package:sweethome/services/auth_services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObsecure = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141228),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.37,
            margin: const EdgeInsets.only(
              top: 130,
              left: 20,
            ),
            child: SafeArea(
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins-Medium'),
                    ),
                    const Text(
                      'Silahkan masuk dengan akun anda',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  ]),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff141228)),
                          ),
                          labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                          labelText: 'Email ',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Color(0xff5A5A5A),
                          )),
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    TextField(
                      obscureText: _isObsecure,
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff141228)),
                          ),
                          labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                          labelText: 'Password ',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.key_outlined,
                            color: Color(0xff5A5A5A),
                          ),
                         suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObsecure = !_isObsecure;
                                });
                              },
                              icon: Icon(
                                _isObsecure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xff141228),
                              )))
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Lupa kata sandi?',
                      style: TextStyle(color: Color(0xff949494)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: loading
                          ? CircularProgressIndicator()
                          : Container(
                              child: ElevatedButton(
                                // onPressed: () {
                                //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> forMyApp()));
          
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  if (_emailController.text == "" ||
                                      _passwordController.text == "") {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("Wajib Diisi !"),
                                      backgroundColor: Colors.red,
                                    ));
                                  } else {
                                    User? result = await AuthServices().login(
                                        _emailController.text,
                                        _passwordController.text,
                                        context);
                                    if (result != null) {
                                      print("Sukses");
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NavBar()),);
                                    }
                                  }
                                  setState(() {
                                    loading = false;
                                  });
                                },
                                child: const Text('Masuk'),
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xff141228),
                                    fixedSize: const Size(240, 44),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50))),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 11.0,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Belum punya akun?',style: TextStyle(color: Colors.grey)),
                        InkWell(
                          child: Text(' Daftar', style: TextStyle(color: Color(0xff566F9F)),),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                          },
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
