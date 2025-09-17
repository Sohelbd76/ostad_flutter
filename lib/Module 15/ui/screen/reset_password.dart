import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostad_flutter/Module%2015/ui/screen/signup_screen.dart';
import '../utils/asset_paths.dart';
import 'login_screen.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  TextEditingController _passwordTEController = TextEditingController();
  TextEditingController _repasswordTEController = TextEditingController();
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
                    'Set Password',
                    style: TextTheme.of(context).headlineLarge,
                  ),
              SizedBox(
                height: 10),
                  Text('Minimum length password 8 character with Latter and number combination',style: TextTheme.of(context).bodySmall,),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _passwordTEController,
                      decoration: InputDecoration(hintText: 'Password')),
                  TextFormField(
                      controller: _repasswordTEController,
                      decoration: InputDecoration(hintText: 'Confirm Password')),
                  SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                      onPressed:onTabLoginButton,
                      child: Text('Confirm',style: TextStyle(color: Colors.white),)),
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
                              ..onTap = onTabLoginButton,
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

  // void onTabSigninButton() {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
  // }
  void onTabLoginButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenn()));
  }


  @override
  void dispose() {
    _passwordTEController.dispose();
    _repasswordTEController.dispose();

    super.dispose();
  }
}
