import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostad_flutter/Module%2015/ui/screen/reset_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../utils/asset_paths.dart';
import 'login_screen.dart';

class PinVerification extends StatefulWidget {
  const PinVerification({super.key});

  @override
  State<PinVerification> createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _errorController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Stack(children: [
            SvgPicture.asset(
              AssetPath.backgroundImg,
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: double.maxFinite,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 82),
                  Text(
                    'PIN Verification',
                    style: TextTheme.of(context).headlineLarge,
                  ),
              SizedBox(
                height: 10),
                  Text('A 6 digit verification pin will send to your email address',style: TextTheme.of(context).bodySmall,),
                  SizedBox(
                    height: 10,
                  ),


                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      selectedColor: Colors.green,
                      selectedBorderWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,

                    // enableActiveFill: true,  Box ar fill color set kora ata
                    controller: _textEditingController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    appContext: context,
                  ),


                  SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                      onPressed: onTabVerifyButton,
                      child: Text('Verify',style: TextStyle(color: Colors.white),)),
                  SizedBox(height: 30,),
                  RichText(
                    text: TextSpan(
                        text: "Have account?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: ' Sign in',
                            style: TextStyle(fontSize: 18, color: Colors.green),
                            recognizer: TapGestureRecognizer()
                              ..onTap = onTabSigninButton,
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void onTabSigninButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenn()));
  }
  void onTabVerifyButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SetPassword()));
  }

}
