import 'package:doob/Component/CustomCheckBox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final Emailcontroller = TextEditingController();
final Passwordcontroller = TextEditingController();
bool view = true;
bool _isChecked = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Container(
                        child:
                            Image.asset("lib/Image/dooblogo.png", height: 150),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Login to your account",
                      style: TextStyle(
                          fontFamily: "Century",
                          color: Color(0xffffffff),
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontFamily: "Century"),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white.withOpacity(0.4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            obscureText: view,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontFamily: "Century"),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white.withOpacity(0.4),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    view = !view;
                                  });
                                },
                                child: Icon(
                                  view
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        CustomCheckbox(
                            isCheck: _isChecked,
                            onchange: () {
                              setState(() {
                                _isChecked = !_isChecked;
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Remeber Me",
                          style: TextStyle(
                              fontFamily: "Century",
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xffFF9800)),
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.mulish(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Forgot the password?",
                      style: TextStyle(
                          fontFamily: "Century",
                          color: Color(0xffff9800),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "or continue with",
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontFamily: "Century",
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: Image.asset(
                            "lib/Image/google.png",
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: Image.asset(
                            "lib/Image/facebook.png",
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: Image.asset(
                            "lib/Image/apple.png",
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: TextSpan(
                          style: GoogleFonts.mulish(color: Colors.white),
                          children: [
                            TextSpan(text: 'Don\'t have an account? '),
                            TextSpan(
                                text: ' Sign Up',
                                style: TextStyle(
                                    color: Color(0xffFF9800),
                                    fontWeight: FontWeight.bold))
                          ]),
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
