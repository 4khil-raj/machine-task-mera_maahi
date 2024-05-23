import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/auth/SignInScreens/PhoneNumber/profile_build.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pinput/pinput.dart';

var otpid;

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool _timerActive = false;
  int _start = 59;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timerActive = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start < 1) {
          _timer?.cancel();
          _timerActive = false;
          // Handle timer completion (e.g., enable resend button)
        } else {
          _start--;
        }
      });
    });
  }

  final otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(234, 239, 243, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE8E6EA)),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: const Color(0xFFE94057),
      ),
      borderRadius: BorderRadius.circular(15),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color(0xFFE94057),
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFE8E6EA)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Color(0xFFE94057),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //     width: 234,
              //     height: 158,
              //     'assets/images/icon.png'),
              // const SizedBox(
              //   height:15,
              // ),
              Text(
                '00:$_start',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _timerActive ? const Color(0xFFE94057) : Colors.grey,
                  fontSize: 34,
                  fontFamily: 'Sk-Modernist',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Type the verification code \nwe’ve sent you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.699999988079071),
                  fontSize: 18,
                  fontFamily: 'Sk-Modernist',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                  controller: otpcontroller,
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  showCursor: true,
                  onCompleted: (d) {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: otpid, smsCode: otpcontroller.text);
                    if (credential != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (phone) => const OtpProfileBuild()));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                content: Text('Some Error Occurs'),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('ok'))
                                ]);
                          });
                    }
                  }),
              const SizedBox(
                height: 50,
              ),
              // SizedBox(
              //   width: 200,
              //   height: 56,
              //   child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //           backgroundColor: const Color(0xFFE94057),
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(15))),
              //       onPressed: () {},
              //       child: const Text(
              //         "Verify",
              //         style: TextStyle(color: Colors.white),
              //       )),
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Send again',
                        style: TextStyle(
                          color: _timerActive
                              ? Colors.grey
                              : const Color(0xFFE94057),
                          fontSize: 16,
                          fontFamily: 'Sk-Modernist',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
