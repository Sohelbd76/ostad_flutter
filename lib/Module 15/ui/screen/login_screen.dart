import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostad_flutter/Module%2015/ui/screen/signup_screen.dart';

import '../utils/asset_paths.dart';
import 'forgot_password_email_verification.dart';
import 'main_nav_bar_holder_screen.dart';

class LoginScreenn extends StatefulWidget {
  const LoginScreenn({super.key});

  @override
  State<LoginScreenn> createState() => _LoginScreennState();
}

class _LoginScreennState extends State<LoginScreenn> {
  TextEditingController _emailTEcontroller = TextEditingController();
  TextEditingController _passwordTEcontroller = TextEditingController();
GlobalKey<FormState> _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
            key: _formKey,
            child:Stack(
              children: [
                const SizedBox(height: 82),
                SvgPicture.asset(
                  AssetPath.backgroundImg,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: double.maxFinite,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        'Get Started with',
                        style: TextTheme.of(context).headlineLarge,
                        //style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailTEcontroller,
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordTEcontroller,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                      const SizedBox(height: 10),

                      FilledButton(
                        onPressed: onTabLoginButton,
                        child: Icon(Icons.arrow_circle_right_outlined),

                      ),

                      SizedBox(
                        height: 38,
                      ),
                      Center(
                        child: Column(
                          children: [
                            TextButton(
                                onPressed: onTabforgotButton,
                                child: Text(
                                  'Forget Password ?',
                                  style: TextStyle(color: Colors.grey, fontSize: 15),
                                )),
                            RichText(
                              text: TextSpan(
                                  text: "Don't have account?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: ' Sign up',
                                      style: TextStyle(fontSize: 18, color: Colors.green),
                                      recognizer: TapGestureRecognizer()..onTap = onTabsignupButton,
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )

          )),
    );
  }
  void onTabsignupButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
  }
  void onTabforgotButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailVerification()));
  }
  void onTabLoginButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>mainNavigationBarHolderScreen()));
  }
  @override
  void dispose() {
 _emailTEcontroller.dispose();
    _passwordTEcontroller.dispose();
    super.dispose();
  }
}
