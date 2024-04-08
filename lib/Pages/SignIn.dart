import 'package:doob/Pages/SignUp.dart';
import 'package:doob/Pages/loginCopy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
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
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                            fontFamily: "Century",
                            color: Color(0xffffffff),
                            fontSize: 20,
                            // fontWeight: FontWeight.bold
                          ),
                          children: [
                            TextSpan(text: 'Let\'s get you in '),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        border: Border.all(color: Colors.white12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('lib/Image/google.png'),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Continue with Google",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(
                                  color: Color(0xffffffff),
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white12),
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/Image/facebook.png',
                            width: 35,
                            //  height: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Continue with Facebook",
                              style: GoogleFonts.mulish(
                                  color: Color(0xffffffff),
                                  //  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white12),
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('lib/Image/apple.png')),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Continuse with Apple",
                              style: GoogleFonts.mulish(
                                  color: Color(0xffffffff),
                                  //  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 10, right: 10),
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
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(left: 10, right: 10, top: 30),
                  //   child: Image.asset('lib/Image/or.png'),
                  // ),
                  Row(
                    children: [
                      Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      // Text(
                      //   'or',
                      //   style: TextStyle(color: Colors.white),
                      // ),
                      Divider(),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, '/loginScreen');
                      Get.to(LoginScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Color(0xffff9800),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text("Log in with a password".tr,
                              style: GoogleFonts.mulish(
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => SignUp());
                      // Navigator.pushNamed(context, '/signUp');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: RichText(
                        text: TextSpan(
                            style: GoogleFonts.mulish(color: Colors.white),
                            children: [
                              TextSpan(
                                  text: 'Don\'t have an account?'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff06F94A),
                                      fontWeight: FontWeight.bold
                                      // color: Colors.green
                                      )),
                              TextSpan(
                                  text: 'Sign Up'.tr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Century',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold
                                  ))
                            ]),
                      ),
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
