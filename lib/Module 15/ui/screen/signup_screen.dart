import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/asset_paths.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailTEController = TextEditingController();
  TextEditingController _firstNameTEController = TextEditingController();
  TextEditingController _lastNameTEController = TextEditingController();
  TextEditingController _mobileTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();
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
                    'Join With Us',
                    style: TextTheme.of(context).headlineLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _emailTEController,
                      decoration: InputDecoration(hintText: 'Email')),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _firstNameTEController,
                      decoration: InputDecoration(hintText: 'First name')),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _lastNameTEController,
                      decoration: InputDecoration(hintText: 'Last Name')),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _mobileTEController,
                      decoration: InputDecoration(hintText: 'Mobile')),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: _passwordTEController,
                      decoration: InputDecoration(hintText: 'Password')),
                  SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                      onPressed: onTabSigninButton,
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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreenn()));
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
