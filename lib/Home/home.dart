import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/Account/Account.dart';
import 'package:new_project/Deposit-Withdraw/Deposit-Withdraw.dart';
import 'package:new_project/Portfolio/Portfolio.dart';
import 'package:new_project/MarketWatch/MarketwatchDetails.dart';
import 'package:new_project/Trade/TradesScreen.dart';
import 'package:new_project/Widget/widget.dart';
import '../MarketWatch/Marketwatch.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    MarketWatchScreen(),
    TradesScreen(),
    DepositWithdrawScreen(),
    PortfolioScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xFF757575),
          backgroundColor: Colors.black, // Change opacity here
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye),
              label: 'Watchlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books_outlined),
              label: 'Trades',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.currency_rupee, size: 20),
              label: 'Deposit/Withdraw',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outline_rounded),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account1',
            ),
          ],
        ),
      ),
    );
  }
}
