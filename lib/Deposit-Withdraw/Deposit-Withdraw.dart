import 'package:flutter/material.dart';
import 'package:new_project/Widget/widget.dart';

class DepositWithdrawScreen extends StatefulWidget {
  const DepositWithdrawScreen({super.key});

  @override
  State<DepositWithdrawScreen> createState() => _DepositWithdrawScreenState();
}

class _DepositWithdrawScreenState extends State<DepositWithdrawScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpeg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'Coming soon',
            style: TextStyle(
                color: WhiteColor
            ),
          ),
        ),
      ),
    );
  }
}