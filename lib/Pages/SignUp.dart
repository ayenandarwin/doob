import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
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
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontFamily: "Century",
                              color: Color(0xffffffff),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: 'Sign Up & Play your favorite Songs on '),
                            TextSpan(
                                text: 'doob!',
                                style: TextStyle(color: Color(0xffFF9800)))
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontFamily: "Century"),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white.withOpacity(0.4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.3),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontFamily: "Century"),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white.withOpacity(0.4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.3),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontFamily: "Century"),
                        prefixIcon: Icon(
                          Icons.vpn_key_outlined,
                          color: Colors.white.withOpacity(0.4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.3),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Comfirm Password',
                        labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontFamily: "Century"),
                        prefixIcon: Icon(
                          Icons.vpn_key_outlined,
                          color: Colors.white.withOpacity(0.4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.3),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontFamily: "Century"),
                        prefixIcon: Icon(
                          Icons.phone_iphone,
                          color: Colors.white.withOpacity(0.4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.3),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Color(0xffff9800),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text("Register",
                            style: GoogleFonts.mulish(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: TextSpan(
                          style: GoogleFonts.mulish(color: Colors.white),
                          children: [
                            TextSpan(text: 'Already have an account? '),
                            TextSpan(
                                text: ' Login',
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
