import 'package:country_code_picker/country_code_picker.dart';
import 'package:doob/Component/CustomCheckBox.dart';
import 'package:doob/Controller/registeration.dart';
import 'package:doob/appStart/navScreen.dart';
import 'package:doob/services/authorizedService.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/global.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../controller/rememberController.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  RememberController rememberController = Get.put(RememberController());
  RegisterationController registerationController = RegisterationController();
  bool view = true;
  bool _isChecked = true;
  String dToken = '';
  //bool _isChecked = false;

  bool _remember = false;
  String? rememberName;
  String? rememberPassword;

  bool isloading = false;

  var _isObscured;
  bool? isChecked = false;

  late Box box1;

  @override
  void initState() {
    // TODO: implement initState
    _isObscured = true;
    createBox();
    super.initState();
    checkRememberUser();
    //postDeviceToken();
  }

  void createBox() async {
    box1 = await Hive.openBox('login');
    getData();
  }

  void getData() {
    if (box1.get('phone') != null) {
      phoneController.text = box1.get('phone');
    }
    if (box1.get('password') != null) {
      passwordController.text = box1.get('password');
      setState(() {
        _isChecked = !_isChecked;
      });
    }
  }

  checkRememberUser() async {
    rememberName = rememberController.readRememberUsername();
    rememberPassword = rememberController.readRememberPassword();
    if (rememberName != "" &&
        rememberName != null &&
        rememberPassword != "" &&
        rememberPassword != null) {
      setState(() {
        phoneController.text = rememberName!;
        passwordController.text = rememberPassword!;
        _remember = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: Center(
                      child: Container(
                        child:
                            Image.asset("assets/Image/dooblogo.png", height: 150),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Text(
                      "Login to your account",
                      style: TextStyle(
                          fontFamily: "Century",
                          color: Color(0xffffffff),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    //  padding: const EdgeInsets.only(
                    //   top: 40, bottom: 5, left: 10, right: 10),
                    child: IntlPhoneField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(50),
                      ],
                      controller: phoneController,
                      focusNode: phoneFocusNode,
                      disableLengthCheck: true,
                      initialCountryCode: 'MM',
                      dropdownTextStyle:
                          TextStyle(fontSize: 14, color: Colors.white),
                      dropdownIcon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 20,
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        counterText: '',
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            // color: Colors.white.withOpacity(0.7),
                            fontFamily: "Century"),
                        prefixIcon: Icon(
                          Icons.phone,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            obscureText: view,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Password'.tr,
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "Century"),
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 20,
                                color: Colors.white,

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
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.3),
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
                  Consumer(
                    builder: (context, ref, child) {
                      return isloading
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 20),
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xffFF9800)),
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                phoneFocusNode.unfocus();
                                passwordFocusNode.unfocus();
                                if (phoneController.text != "" &&
                                    passwordController.text != "") {
                                  setState(() {
                                    isloading = true;
                                  });
                                  ref
                                      .watch(authServiceProvider)
                                      .login(
                                        phone: phoneController.text,
                                        password: passwordController.text,
                                      )
                                      .then((value) async {
                                    print(value);
                                    var status = value["status"];
                                    if (status.toString() == "true") {
                                      var token = value["token"];
                                      await SharedPref.setData(
                                          key: SharedPref.token,
                                          value: "Bearer $token");
                                      
                                      Global.isLogIn = true;
                                      Global.loginStatus();
                                      loginData();

                                      print('Device token Success');

                                      setState(() {
                                        isloading = false;
                                      });

                                      Get.off(() => NaviScreen());
                                    } else {
                                      setState(() {
                                        isloading = false;
                                        phoneController.clear();
                                        passwordController.clear();
                                        Get.snackbar(
                                          "Alert",
                                          "အကောင့်ဝင်ခြင်း မအောင်မြင်ပါ",
                                          backgroundColor: Colors.redAccent,
                                        );
                                      });
                                    }
                                  });
                                } else {
                                  Get.snackbar(
                                    "Alert",
                                    "Please Enter Required Field",
                                    backgroundColor: Colors.redAccent,
                                  );
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 20),
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xffFF9800)),
                                  child: Center(
                                    child: Text(
                                      "Login".tr,
                                      style: GoogleFonts.mulish(
                                          color: Color(0xffffffff),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                  
                  // InkWell(
                  //   onTap: () {
                  //     // login(
                  //     //   phoneController.text.toString(),
                  //     //   passwordController.text.toString(),
                  //     // );

                  //     // .then((value) async {
                  //     //   print(value);
                  //     //   var status = value["status"];
                  //     //   if (status.toString() == "true") {
                  //     //     var token = value["token"];
                  //     //     await SharedPref.setData(
                  //     //         key: SharedPref.token, value: "Bearer $token");
                  //     //     if (_remember) {
                  //     //       print("Remember $token ***********************");
                  //     //       rememberController.saveRememberUserName(
                  //     //           username: phonecontroller.text);
                  //     //       rememberController.saveRememberPassword(
                  //     //           password: passwordcontroller.text);
                  //     //     } else {
                  //     //       rememberController.removeRememberUsername();
                  //     //       rememberController.removeRememberPassword();
                  //     //     }
                  //     //     Global.isLogIn = true;
                  //     //     Global.loginStatus();
                  //     //     setState(() {
                  //     //       isloading = false;
                  //     //     });
                  //     //     Get.off(() => Empty());
                  //     //   } else {
                  //     //     setState(() {
                  //     //       isloading = false;
                  //     //       phonecontroller.clear();
                  //     //       passwordcontroller.clear();
                  //     //       Get.snackbar(
                  //     //         "Alert",
                  //     //         "အကောင့်ဝင်ခြင်း မအောင်မြင်ပါ",
                  //     //         backgroundColor: Colors.redAccent,
                  //     //       );
                  //     //     });
                  //     //   }
                  //     // });
                  //     Navigator.pushNamed(context, '/empty');
                  //   },
                  // child: Padding(
                  //   padding: const EdgeInsets.only(top: 30, bottom: 20),
                  //   child: Container(
                  //     height: 40,
                  //     width: 150,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(50),
                  //         color: Color(0xffFF9800)),
                  //     child: Center(
                  //       child: Text(
                  //         "Login",
                  //         style: GoogleFonts.mulish(
                  //             color: Color(0xffffffff),
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 16),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "Forgot the password?".tr,
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
                          "or continue with".tr,
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
                        GestureDetector(
                          onTap: () async {
                            var token = registerationController
                                .authenticateWithGoogle(context: context);

                            await SharedPref.setData(
                                key: SharedPref.token, value: "Bearer $token");
                            Global.isLogIn = true;
                            Global.loginStatus();
                           // loginData();

                            print('Device token Success');

                            setState(() {
                              isloading = false;
                            });

                            Get.off(() => NaviScreen());
                            
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              // color: Colors.white12
                            ),
                            child: Image.asset(
                              "assets/Image/google.png",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () 
                          async {
                            var token = registerationController
                                .authenticateWithFacebook(context: context);

                            await SharedPref.setData(
                                key: SharedPref.token, value: "Bearer $token");
                            Global.isLogIn = true;
                            Global.loginStatus();
                           // loginData();

                            print('Device token Success');

                            setState(() {
                              isloading = false;
                            });

                            Get.off(() => NaviScreen());
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white12),
                            child: Image.asset(
                              "assets/Image/facebook.png",
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset(
                            "assets/Image/apple.png",
                           // 'assets\Image\apple.png',
                            
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: RichText(
                        text: TextSpan(
                            style: GoogleFonts.mulish(color: Colors.white),
                            children: [
                              TextSpan(
                                  text: "Don't have an account?".tr,
                                  style: TextStyle(
                                      color: Color(0xff06F94A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'Sign Up'.tr,
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

  void loginData() {
    if (_isChecked) {
      box1.put('phone', phoneController.text);
      box1.put('password', passwordController.text);
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((dtoken) {
      setState(() {
        dToken = dtoken.toString();
        print('device token **************j');
      });
    });
  }

  // void saveToken(String token) async {
  //   await FirebaseFirestore.instance
  //       .collection('userTokens')
  //       .doc('Users2')
  //       .set({
  //         'token':token,
  //       });
  // }
}
