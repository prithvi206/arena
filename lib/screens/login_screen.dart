import 'package:firebase_auth_demo/screens/home_screen.dart';
import 'package:firebase_auth_demo/screens/login_email_password_screen.dart';
import 'package:firebase_auth_demo/screens/phone_screen.dart';
import 'package:firebase_auth_demo/screens/signup_email_password_screen.dart';
import 'package:firebase_auth_demo/utils/colors.dart';
import 'package:firebase_auth_demo/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../services/firebase_auth_methods.dart';

class LoginScreen extends StatefulWidget {
  static String routeName='/login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
String? errorMessage = '';
bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pay. Pool. Play", 
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          ).copyWith(
            color: buttonColor,
          )
          ),
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: Image.asset('assets/images/arena.jpg'),
          ),
            CustomButton(
              onTap: (){
                Navigator.pushNamed(context, EmailPasswordLogin.routeName);
              },
              text: 'Login with Email',
            ),
            CustomButton(
              onTap: (){
                Navigator.pushNamed(context, EmailPasswordSignup.routeName);
              },
              text: 'Sign Up with Email',
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, PhoneScreen.routeName);
              },
              text: 'Login with Phone Number '
            ),
            CustomButton(
              onTap: () {},
              text: 'Google Sign-In',
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, HomePage.routeName);
              },
              text: 'Guest Login',
            ),
          ]
          ),
          )
    );
  }
}