import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostad_flutter/Module%2015/ui/screen/forgot_password_pin_verification.dart';
import '../utils/asset_paths.dart';
import 'login_screen.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  TextEditingController _emailTEController = TextEditingController();
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
                    'Your Email Address',
                    style: TextTheme.of(context).headlineLarge,
                  ),
              SizedBox(
                height: 10),
                  Text('A 6 digit verification pin will send to your email address',style: TextTheme.of(context).bodySmall,),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _emailTEController,
                      decoration: InputDecoration(hintText: 'Email')),
                  SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                      onPressed: onTabEmailVerificationButton,
                      child: Icon(Icons.arrow_circle_right_outlined)),
                  SizedBox(
                    height: 30,
                  ),
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
void onTabEmailVerificationButton(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PinVerification()));
}


  @override
  void dispose() {
    _emailTEController.dispose();

    super.dispose();
  }
}
