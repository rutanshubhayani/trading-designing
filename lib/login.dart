import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/Home/home.dart';
import 'package:new_project/Widget/widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool obsecurePassword = true;

  @override
  void dispose() {
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  void login(){
    Get.offAll(() => MyHomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          CircleAvatar(
            radius: 50,
            backgroundColor: WhiteColor,
            backgroundImage: AssetImage('images/dollar.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ABC world',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: WhiteColor,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: TextFormField(
              focusNode: emailFocusNode,
              style: TextStyle(color: WhiteColor),
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: WhiteColor),
                prefixIcon: Icon(Icons.person, color: WhiteColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: WhiteColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: WhiteColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: WhiteColor),
                ),
              ),
              onFieldSubmitted: (value){
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              obscureText: obsecurePassword,
              focusNode: passwordFocusNode,
              style: TextStyle(color: WhiteColor),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: WhiteColor),
                prefixIcon: Icon(Icons.lock_outline, color: WhiteColor),
                suffixIcon: IconButton(
                  icon: Icon(
                  obsecurePassword ? Icons.visibility_off : Icons.visibility,color: WhiteColor,
                ),
                  onPressed: (){
                    setState(() {
                      obsecurePassword = !obsecurePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: WhiteColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: WhiteColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: WhiteColor),
                ),
              ),
              onFieldSubmitted: (value){
                login();
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              autofocus: true,
              onPressed: login,
              child: Text(
                'Login',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: WhiteColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'No real money involved.',
                    style: TextStyle(color: WhiteColor, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'This is a Virtual Trading Application which has all the features to trade.',
                    style: TextStyle(color: WhiteColor),

                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'This Application is used for exchanging views on markets for individual students for training purpose only.',
              style: TextStyle(color: WhiteColor),
            ),
          ),
          Spacer(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Got any questions? ',
                  style: TextStyle(color: WhiteColor),
                ),
                TextSpan(
                  text: 'Contact us',
                  style: TextStyle(
                    color: WhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('Contact us tapped');
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
