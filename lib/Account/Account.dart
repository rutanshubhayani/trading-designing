import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_project/Account/changepassword.dart';
import 'package:new_project/Account/funds.dart';
import 'package:new_project/Account/notifications.dart';
import 'package:new_project/Account/profile.dart';
import 'package:new_project/login.dart';

import '../Widget/widget.dart';  // Ensure this is properly defined or replace with appropriate colors.

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpeg'), // Ensure the image path is correct
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'My Account',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black54,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'USERNAME (ABCPQR)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.notifications, color: Colors.white),
                      title: Text(
                        'Notifications',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onTap: () {
                        Get.to(() => NotificationsScreen());
                      },
                    ),
                    Divider(color: Colors.white54),
                    ListTile(
                      leading: Icon(Icons.account_balance_wallet, color: Colors.white),
                      title: Text(
                        'Funds',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onTap: () {
                        Get.to(() => FundsScreen());
                      },
                    ),
                    Divider(color: Colors.white54),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.white),
                      title: Text(
                        'Profile',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onTap: () {
                        Get.to(() => ProfileScreen());
                      },
                    ),
                    Divider(color: Colors.white54),
                    ListTile(
                      leading: Icon(Icons.lock, color: Colors.white),
                      title: Text(
                        'Change Password',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onTap: () {
                        Get.to(() => ChangePassword());
                      },
                    ),
                    Divider(color: Colors.white54),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.white),
                      title: Text(
                        'Log Out',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onTap: () {
                      },
                    ),
                    Divider(color: Colors.white54),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
