import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SCLogin extends StatefulWidget {
  const SCLogin({super.key});

  @override
  State<SCLogin> createState() => _SCLoginState();
}

class _SCLoginState extends State<SCLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Container(
                      child: Image.asset("assets/Image/dooblogo.png", height: 150),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Let get you in",
                    style: TextStyle(
                        fontFamily: "Century",
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffDBE7E8).withOpacity(0.2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Image.asset('assets/Image/google.png')),
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Containue with Google',
                            style: TextStyle(
                                fontFamily: "Century",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffDBE7E8).withOpacity(0.2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            'assets/Image/facebook.png',
                            width: 35,
                            height: 30,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Containue with Facebook',
                            style: TextStyle(
                                fontFamily: "Century",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffDBE7E8).withOpacity(0.2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1, child: Image.asset('assets/Image/apple.png')),
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Containue with Apple',
                            style: TextStyle(
                                fontFamily: "Century",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
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
                        "or",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontFamily: "Century",
                            fontSize: 16,
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
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Color(0xffff9800),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text("Login with a password",
                          style: GoogleFonts.mulish(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
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
    );
  }
}
