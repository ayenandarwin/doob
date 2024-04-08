import 'package:device_info_plus/device_info_plus.dart';
import 'package:doob/Controller/isLoginController.dart';
import 'package:doob/Pages/loginCopy.dart';
import 'package:doob/services/authorizedService.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/global.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:country_code_picker/country_code_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final dateInput = TextEditingController();
  final nameController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();

  final emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  final passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  final comfirmPasswordController = TextEditingController();
  FocusNode comfirmPasswordFocusNode = FocusNode();

  final phoneController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();

  String text = "";
  int maxLength = 50;

  bool _obscureTextLogin = true;
  bool _obscureConfirmTextLogin = true;

  final IsLoginController isLoginController = Get.put(IsLoginController());
  bool isloading = false;

  // register(String name, password, phone) async {
  //   // final token = await SharedPref.getData(key: SharedPref.token);
  //   final response = await http.post(Uri.parse(ApiUrl.registerUrl),
  //       // headers: {
  //       //   'Accept': 'application/json;charset=UTF-8',
  //       //   // 'Authorization': token!
  //       // },
  //       body: {
  //         'name': name,
  //         'phone': phone,
  //         'password': password,
  //       });

  //   if (response.statusCode == 200) {
  //     print("API Result ${response.body}");
  //     // print('******* $token');
  //   } else {
  //     print('error');
  //   }
  // }

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  AndroidDeviceInfo? androidInfo;
  Future<AndroidDeviceInfo> getInfo() async {
    return await deviceInfo.androidInfo;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    padding: const EdgeInsets.only(top: 30),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                            fontFamily: "Century",
                            color: Color(0xffffffff),
                            fontSize: 20,
                            //fontWeight: FontWeight.bold
                          ),
                          children: [
                            TextSpan(text: 'Connect with '),
                            TextSpan(
                                text: 'doob',
                                style: TextStyle(color: Color(0xffFF9800))),
                            TextSpan(text: '!'),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 35, bottom: 5, left: 10, right: 10),
                    child: SizedBox(
                      height: 60,
                      child: TextField(
                        controller: nameController,
                        focusNode: nameFocusNode,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Name'.tr,
                          labelStyle: TextStyle(
                              // color: Colors.white.withOpacity(0.6),
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Century"),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 20,
                            color: Colors.white,
                            // color: Colors.white.withOpacity(0.8),
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: SizedBox(
                      height: 60,
                      child: TextField(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Email'.tr,
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,

                              // color: Colors.white.withOpacity(0.6),
                              fontFamily: "Century"),
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            size: 20,

                            color: Colors.white,

                            // color: Colors.white.withOpacity(0.4),
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: SizedBox(
                      height: 60,
                      child: TextField(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password'.tr,
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,

                              // color: Colors.white.withOpacity(0.6),
                              fontFamily: "Century"),
                          prefixIcon: Icon(
                            Icons.vpn_key_outlined,
                            size: 20,

                            color: Colors.white,

                            //color: Colors.white.withOpacity(0.4),
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: SizedBox(
                      height: 60,
                      child: TextField(
                        controller: comfirmPasswordController,
                        focusNode: comfirmPasswordFocusNode,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Comfirm Password'.tr,
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,

                              // color: Colors.white.withOpacity(0.6),
                              fontFamily: "Century"),
                          prefixIcon: Icon(
                            Icons.vpn_key_outlined,
                            size: 20,

                            color: Colors.white,

                            // color: Colors.white.withOpacity(0.4),
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
                  ),
                  // IntlPhoneField(

                  // ),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: IntlPhoneField(
                      inputFormatters: [LengthLimitingTextInputFormatter(50)],
                      controller: phoneController,

                      // onChanged: (String phone) {
                      //   if (phone.length <= maxLength) {
                      //     text = phone;
                      //   } else {
                      //     phoneController = text;
                      //   }
                      // },
                      keyboardType: TextInputType.number,
                      focusNode: phoneFocusNode,
                      initialCountryCode: 'MM',
                      disableLengthCheck: true,

                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                      dropdownTextStyle:
                          TextStyle(fontSize: 14, color: Colors.white),
                      dropdownIcon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 20,
                      ),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        counterText: '',
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,

                            // color: Colors.white.withOpacity(0.6),
                            fontFamily: "Century"),
                        prefixIcon: Icon(
                          Icons.phone_iphone,
                          size: 20,

                          color: Colors.white,

                          // color: Colors.white.withOpacity(0.4),
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

                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  //   child: SizedBox(
                  //     height: 60,
                  //     child: Container(
                  //       //    padding: EdgeInsets.only(bottom: 5),
                  //       child: TextFormField(
                  //         inputFormatters: [
                  //           LengthLimitingTextInputFormatter(100)
                  //         ],
                  //         onChanged: (phone) {},
                  //         controller: phoneController,
                  //         textAlignVertical: TextAlignVertical.center,
                  //         // textAlign: TextAlign.center,

                  //         keyboardType: TextInputType.number,
                  //         focusNode: phoneFocusNode,
                  //         maxLength: null,
                  //         // initialCountryCode: 'MM',
                  //         // dropdownTextStyle:
                  //         //     TextStyle(fontSize: 14, color: Colors.white),
                  //         // dropdownIcon: Icon(
                  //         //   Icons.arrow_drop_down,
                  //         //   color: Colors.white,
                  //         //   size: 20,
                  //         // ),
                  //         style: TextStyle(color: Colors.white),
                  //         decoration: InputDecoration(
                  //           labelText: 'Phone Number'.tr,
                  //           counterText: '',
                  //           labelStyle: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 14,

                  //               // color: Colors.white.withOpacity(0.6),
                  //               fontFamily: "Century"),
                  //           prefixIcon: CountryCodePicker(
                  //             initialSelection: 'MM',
                  //             showCountryOnly: true,
                  //             textStyle:
                  //                 TextStyle(fontSize: 14, color: Colors.white),
                  //           ),
                  //           // prefixIcon: Icon(
                  //           //   Icons.phone_iphone,
                  //           //   size: 20,

                  //           //   color: Colors.white,

                  //           //   // color: Colors.white.withOpacity(0.4),
                  //           // ),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10),
                  //             borderSide: BorderSide(
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10),
                  //             borderSide:
                  //                 BorderSide(color: Colors.white, width: 0.3),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Consumer(
                    builder: (context, ref, child) {
                      return isloading
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Color(0xffff9800),
                                  borderRadius: BorderRadius.circular(50),
                                ),
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
                          // Card(
                          //     color: CustomColors.mainColor,
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(5.0),
                          //     ),
                          //     elevation: 5,
                          //     child: Container(
                          //       height: 50,
                          //       alignment: Alignment.center,
                          //       child: CircularProgressIndicator(
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //   )
                          : InkWell(
                              onTap: () {
                                // if (_formKey.currentState!.validate()) {
                                //   print('From is valid');
                                // }
                                nameFocusNode.unfocus();
                                passwordFocusNode.unfocus();
                                phoneFocusNode.unfocus();
                                emailFocusNode.unfocus();
                                comfirmPasswordFocusNode.unfocus();
                                setState(() {
                                  isloading = true;
                                });
                                if (nameController.text != "" &&
                                    phoneController.text != "" &&
                                    passwordController.text != "" &&
                                    comfirmPasswordController.text != "" &&
                                    emailController.text != "") {
                                  setState(() {
                                    isloading = true;
                                  });
                                  ref
                                      .watch(authServiceProvider)
                                      .register(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        password: passwordController.text,
                                        //confirm_password: comfirmPasswordController.text,
                                        //email: emailController.text,
                                      )
                                      .then((value) async {
                                    print(value);

                                    var status = value["status"];
                                    if (status.toString() == 'true') {
                                      var token = value["token"];

                                      // var token = value["data"]["token"];

                                      // await SharedPref.setBoolForLoginUser(
                                      //     key: SharedPref.islogin, value: true);
                                      await SharedPref.setData(
                                          key: SharedPref.token,
                                          value: "Bearer $token");
                                      //  isLoginController.login();
                                      Global.isLogIn = true;
                                      Global.loginStatus();
                                      setState(() {
                                        isloading = false;
                                      });
                                      // Navigator.pop(context);

                                      Get.to(() => LoginScreen());
                                    } else {
                                      setState(() {
                                        isloading = false;
                                        phoneController.clear();
                                        passwordController.clear();
                                        nameController.clear();
                                        comfirmPasswordController.clear();
                                        var error = value["data"]["phone"];
                                        Get.snackbar("Alert",
                                            "အကောင့်အသစ်ဖွင့်ခြင်း မအောင်မြင်ပါ");
                                      });
                                    }
                                  });
                                }
                                // Navigator.pushNamed(context, '/loginScreen');
                                // Get.off(() => VerifyCodeScreen());
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25),
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xffff9800),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text("Register".tr,
                                        style: GoogleFonts.mulish(
                                            color: Color(0xffffffff),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                ),
                              ),
                            );
                    },
                  ),

                  // InkWell(
                  //   onTap: () {
                  //     register(
                  //         nameController.text.toString(),
                  //         //  emailController.text.toString(),
                  //         passwordController.text.toString(),
                  //         phoneController.text.toString());
                  //     Navigator.pushNamed(context, '/login');
                  //   },
                  // child:
                  //  Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 25),
                  //   child: Container(
                  //     height: 40,
                  //     width: 150,
                  //     decoration: BoxDecoration(
                  //       color: Color(0xffff9800),
                  //       borderRadius: BorderRadius.circular(50),
                  //     ),
                  //     child: Center(
                  //       child: Text("Register",
                  //           style: GoogleFonts.mulish(
                  //               color: Color(0xffffffff),
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 16)),
                  //     ),
                  //   ),
                  // ),
                  //),
                  InkWell(
                    onTap: () {
                      Get.to(() => LoginScreen());
                      // Navigator.pushNamed(context, '/loginScreen');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: RichText(
                        text: TextSpan(
                            style: GoogleFonts.mulish(color: Colors.white),
                            children: [
                              TextSpan(
                                  text: 'Already have an account?'.tr,
                                  style: TextStyle(
                                      color: Color(0xffFF9800),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'Login'.tr,
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
