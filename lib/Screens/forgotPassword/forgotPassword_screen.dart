import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/button.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/widgets/form_field.dart';
import 'package:mere_maahi_dummy/forget_repo/forget_pass_repo.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

final forgetEmailController = TextEditingController();
bool loading = false;

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    // loading = false;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Forget Password'),
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GradientText(
                        colors: [
                          Colors.black,
                          Colors.red,
                        ],
                        'Mera Maahi',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 23),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter Email',
                        controller: forgetEmailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      loading
                          ? CircularProgressIndicator(
                              color: Colors.red,
                            )
                          : customButton(
                              isRow: false,
                              color: Colors.red,
                              name: 'Get Link',
                              height: 50,
                              onTap: () {
                                setState(() {
                                  loading = true;
                                });
                                ForgetPasscodeRepo().forgetpasscode(context,
                                    forgetEmailController.text.toString());
                              },
                              radius: 20,
                              textsize: 14,
                              borderclr: Colors.transparent,
                              textclr: Colors.white,
                            )
                    ]))));
  }
}
