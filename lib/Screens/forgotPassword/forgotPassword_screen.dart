import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/button.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/widgets/form_field.dart';
import 'package:mere_maahi_dummy/forget_repo/forget_pass_repo.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

final forgetEmailController = TextEditingController();

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Forget Password'),
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  const Text('mera_maahi'),
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
                  customButton(
                    isRow: false,
                    color: Colors.black,
                    name: 'Get Link',
                    height: 50,
                    onTap: () {
                      ForgetPasscodeRepo().forgetpasscode(
                          context, forgetEmailController.text.toString());
                    },
                    radius: 20,
                    textsize: 14,
                    borderclr: Colors.transparent,
                    textclr: Colors.white,
                  )
                ]))));
  }
}
