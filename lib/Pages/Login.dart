import 'dart:math';
import 'package:doob/Component/CustomCheckBox.dart';
import 'package:doob/Component/Empty.dart';
import 'package:doob/Controller/rememberController.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/global.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final phonecontroller = TextEditingController();
final passwordcontroller = TextEditingController();
FocusNode phoneFocusNode = FocusNode();
FocusNode passwordFocusNode = FocusNode();

//RememberController rememberController = Get.put(RememberController());

bool view = true;
bool _isChecked = true;
bool _remember = false;
//String? rememberName;
//String? rememberPassword;
// bool showPassword = false;
bool isloading = false;

var _isObscured;
bool? isChecked = false;

login(String phone, password) async {
  final String? token = await SharedPref.getData(key: SharedPref.token);

  final response = await http.post(Uri.parse(ApiUrl.loginUrl), headers: {
    'Accept': 'application/json;charset=UTF-8',
    // 'Authorization': token!
  }, body: {
    'phone': phone,
    'password': password,
  });

  if (response.statusCode == 200) {
    print("API Result ${response.body}");
    // print('******* $token');
  } else {
    print('error');
  }
}

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
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Center(
                      child: Container(
                        child:
                            Image.asset("lib/Image/dooblogo.png", height: 150),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Login to your account",
                      style: TextStyle(
                          fontFamily: "Century",
                          color: Color(0xffffffff),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 10,
                  //     bottom: 5,
                  //   ),
                  //   child: SizedBox(
                  //     height: 50,
                  //     child: TextField(
                  //       style: TextStyle(color: Colors.white),
                  //       decoration: InputDecoration(
                  //         labelText: 'Email',
                  //         labelStyle: TextStyle(
                  //             // color: Colors.white.withOpacity(0.6),
                  //             color: Colors.white,
                  //             fontSize: 14,
                  //             fontFamily: "Century"),
                  //         prefixIcon: Icon(
                  //           Icons.email,
                  //           size: 20,
                  //           color: Colors.white,
                  //           // color: Colors.white.withOpacity(0.8),
                  //         ),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide: BorderSide(
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide:
                  //               BorderSide(color: Colors.white, width: 0.3),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 10,
                  //     bottom: 5,
                  //   ),
                  //   child: SizedBox(
                  //     height: 50,
                  //     child: TextField(
                  //       style: TextStyle(color: Colors.white),
                  //       decoration: InputDecoration(
                  //         labelText: 'Password',
                  //         labelStyle: TextStyle(
                  //             // color: Colors.white.withOpacity(0.6),
                  //             color: Colors.white,
                  //             fontSize: 14,
                  //             fontFamily: "Century"),
                  //         prefixIcon: Icon(
                  //           Icons.lock,
                  //           size: 20,
                  //           color: Colors.white,
                  //           // color: Colors.white.withOpacity(0.8),
                  //         ),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide: BorderSide(
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide:
                  //               BorderSide(color: Colors.white, width: 0.3),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    //  padding: const EdgeInsets.only(
                    //   top: 40, bottom: 5, left: 10, right: 10),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: phonecontroller,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              // color: Colors.white.withOpacity(0.7),
                              fontFamily: "Century"),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                            size: 20,
                            // color: Colors.white.withOpacity(0.4),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              controller: passwordcontroller,
                              obscureText: view,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    //color: Colors.white.withOpacity(0.7),
                                    fontFamily: "Century"),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 20,
                                  color: Colors.white,

                                  // color: Colors.white.withOpacity(0.4),
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
                                    color: Colors.white,
                                    size: 20,

                                    // color: Colors.white.withOpacity(0.4),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0.3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                  InkWell(
                    onTap: () {
                      login(
                        phonecontroller.text.toString(),
                        passwordcontroller.text.toString(),
                      );

                      // .then((value) async {
                      //   print(value);
                      //   var status = value["status"];
                      //   if (status.toString() == "true") {
                      //     var token = value["token"];
                      //     await SharedPref.setData(
                      //         key: SharedPref.token, value: "Bearer $token");
                      //     if (_remember) {
                      //       print("Remember $token ***********************");
                      //       rememberController.saveRememberUserName(
                      //           username: phonecontroller.text);
                      //       rememberController.saveRememberPassword(
                      //           password: passwordcontroller.text);
                      //     } else {
                      //       rememberController.removeRememberUsername();
                      //       rememberController.removeRememberPassword();
                      //     }
                      //     Global.isLogIn = true;
                      //     Global.loginStatus();
                      //     setState(() {
                      //       isloading = false;
                      //     });
                      //     Get.off(() => Empty());
                      //   } else {
                      //     setState(() {
                      //       isloading = false;
                      //       phonecontroller.clear();
                      //       passwordcontroller.clear();
                      //       Get.snackbar(
                      //         "Alert",
                      //         "အကောင့်ဝင်ခြင်း မအောင်မြင်ပါ",
                      //         backgroundColor: Colors.redAccent,
                      //       );
                      //     });
                      //   }
                      // });
                      Navigator.pushNamed(context, '/empty');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xffFF9800)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: GoogleFonts.mulish(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
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
                        fontSize: 16,
                        color: Colors.white,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
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
                            // color: Colors.white12
                          ),
                          child: Image.asset(
                            "lib/Image/google.png",
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white12),
                          child: Image.asset(
                            "lib/Image/facebook.png",
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            // color: Colors.white12
                          ),
                          child: Image.asset(
                            "lib/Image/apple.png",
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,'/'
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: RichText(
                        text: TextSpan(
                            style: GoogleFonts.mulish(color: Colors.white),
                            children: [
                              TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: TextStyle(
                                      color: Color(0xff06F94A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))
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
