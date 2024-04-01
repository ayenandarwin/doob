import 'package:flutter/material.dart';

class HelpAndFeedback extends StatefulWidget {
  const HelpAndFeedback({Key? key}) : super(key: key);
  // static const path = 'HelpAndFeedback';

  @override
  _HelpAndFeedbackState createState() => _HelpAndFeedbackState();
}

class _HelpAndFeedbackState extends State<HelpAndFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Help & Feedback',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Century',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      // AppBar(
      //   backgroundColor: Color(0xffff9800),
      //   // const Color(0xff0000ff),
      //   title: const Text(
      //     'Help & Feedback',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   leading: Icon(
      //     Icons.arrow_back,
      //     color: Colors.white,
      //   ),
      // ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hey there',
                      style: TextStyle(
                          //color: Color(0xff222222),
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Century'),
                    ),
                    const Text(
                      'How can we help?.',
                      style: TextStyle(
                          //color: Color(0xff222222),
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Century'),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    const Text(
                      'Help & FQA',
                      style: TextStyle(
                          //  color: Color(0xff222222),
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Century'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Google Translate is a multilingual neural machine translation service  developed by Google to translate text, documents and websites from one language into another.',
                      style: TextStyle(
                        //  color: Color(0xff222222),
                        color: Colors.white,
                        fontSize: 14,
                        //fontWeight: FontWeight.w500,
                        fontFamily: 'Century',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'We appreciate that iTools are popular with teachers and students and have been used for many years. Unfortunately, iTools needs Adobe Flash to run, and Adobe has now stopped supporting Flash.This means any device running Flash, like iTools ,will be open to security risks.',
                      style: TextStyle(
                          // color: Color(0xff222222),
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Century'),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    const Text(
                      'Google Translate is a multilingual neural machine translation service  developed by Google to translate text, documents and websites from one language into another.',
                      style: TextStyle(
                          //color: Color(0xff222222),
                          color: Colors.white,
                          fontSize: 14,
                          //fontWeight: FontWeight.w500,
                          fontFamily: 'Century'),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            //  const Color(0xff3333ff),
                            Color(0xffff9800),
                          ),
                        ),
                        onPressed: () {
                          // return context.go(HomeScreen.path +
                          //     BookDetailScreen.path +
                          //     '/' +
                          //     BookReader.path);
                        },
                        child: const Text(
                          'Contact Us',
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Century'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
