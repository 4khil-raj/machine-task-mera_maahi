import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mere_maahi_dummy/auth/SignInScreens/PhoneNumber/otp_repo.dart';

import 'OtpScreen.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

TextEditingController _phoneController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _countryController = TextEditingController();

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _phoneController.dispose();
  //   _emailController.dispose();
  //   _countryController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(left: 28, right: 28, top: 240),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'My mobile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontFamily: 'Sk-Modernist',
                  fontWeight: FontWeight.w700,
                  height: 0.04,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 12),
                width: 290,
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  'Please enter your valid phone number. We will send you a 4-digit code to verify your account. ',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.699999988079071),
                    fontSize: 14,
                    fontFamily: 'Sk-Modernist',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            IntlPhoneField(
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(),
                ),
                prefixIcon: Text('+'),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                setState(() {
                  _phoneController.text = phone.completeNumber;
                });
              },
            ),
            // Container(
            //   height: 58,
            //   decoration: ShapeDecoration(
            //     color: Colors.white,
            //     shape: RoundedRectangleBorder(
            //       side: const BorderSide(width: 1, color: Color(0xFFE8E6EA)),
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       SizedBox(
            //         width: 40,
            //         child: TextFormField(
            //           controller: _countryController,
            //           keyboardType: TextInputType.number,
            //           decoration: const InputDecoration(
            //             hintText: '+**',
            //             // suffixIcon: Icon(Icons.keyboard_arrow_down),
            //             border: InputBorder.none,
            //           ),
            //         ),
            //       ),
            //       const Text(
            //         "|",
            //         style: TextStyle(fontSize: 33, color: Colors.grey),
            //       ),
            //       Expanded(
            //           child: TextFormField(
            //         controller: _phoneController,
            //         decoration: const InputDecoration(
            //           contentPadding: EdgeInsets.only(left: 10),
            //           border: InputBorder.none,
            //           hintText: "Phone number",
            //         ),
            //         keyboardType: TextInputType.number,
            //       ))
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 54,
            // ),
            // const Text(
            //   'Email ID',
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 32,
            //     fontFamily: 'Inter',
            //     fontWeight: FontWeight.w700,
            //     height: 0.05,
            //   ),
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            // TextFormField(
            //   decoration: InputDecoration(
            //     focusedBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //           strokeAlign: BorderSide.strokeAlignCenter,
            //           color: Color(0xFF0F0D23),
            //         ),
            //         borderRadius: BorderRadius.circular(20)),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 296,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE94057),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () async {
                    await OtpAuthModel().loginWithPhone(
                        phoneNumber:
                            // _countryController.text +
                            _phoneController.text,
                        verificationCompleted:
                            (PhoneAuthCredential credential) {
                          // add(OnOtpAuthenticatedEvent(credential: credential));
                        },
                        verificationFailed: (FirebaseAuthException e) {
                          // add(OnOtpErrorEvent(msg: e.message.toString()));
                        },
                        codeSent: (String verificationId, int? refreshToken) {
                          setState(() {
                            otpid = verificationId;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => const OtpScreen()));
                          // add(OnphoneOtpSend(
                          //     token: refreshToken, verifiactionId: verificationId));
                        },
                        codeAutoRetrievalTimeout: (String verifiacationId) {});
                    // Navigator.push(context, MaterialPageRoute(builder: (builder)=> const OtpScreen()));
                  },
                  child: const Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Sk-Modernist',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
