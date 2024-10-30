import 'package:flutter/material.dart';
import 'package:new_project/Widget/widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: WhiteColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              color: WhiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black26,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildCard(
                  'NSE: Trading Enabled',
                  brokerage: '3000 per crore',
                  marginIntraday: 'Turnover / 1000',
                  marginHolding: 'Turnover / 200',
                ),
                buildCard(
                  'Options: Trading Enabled',
                  brokerage: '10 per lot',
                  marginIntraday: 'Turnover / 5',
                  marginHolding: 'Turnover / 2.000000',
                ),
                buildMCXCard(
                  'MCX: Trading Enabled',
                  exposureType: 'per_turnover',
                  brokerage: '1000 per crore',
                  marginIntraday: 'Turnover / 500',
                  marginHolding: 'Turnover / 100',
                ),
                buildEmptyCard('Comex: Trading'),
                buildEmptyCard('Forex: Trading'),
                buildEmptyCard('Crypto: Trading'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(String title,
      {required String brokerage, required String marginIntraday, required String marginHolding}) {
    return Card(
      color: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            buildInfoRow('Brokerage', brokerage),
            const SizedBox(height: 10),
            buildInfoRow('Margin Intraday', marginIntraday),
            const SizedBox(height: 10),
            buildInfoRow('Margin Holding', marginHolding),
          ],
        ),
      ),
    );
  }

  // Specialized MCX Card with Exposure Type
  Widget buildMCXCard(String title,
      {required String exposureType, required String brokerage, required String marginIntraday, required String marginHolding}) {
    return Card(
      color: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            buildInfoRow('Exposure Type', exposureType),
            const SizedBox(height: 10),
            buildInfoRow('Brokerage', brokerage),
            const SizedBox(height: 10),
            buildInfoRow('Margin Intraday', marginIntraday),
            const SizedBox(height: 10),
            buildInfoRow('Margin Holding', marginHolding),
          ],
        ),
      ),
    );
  }

  Widget buildEmptyCard(String title) {
    return Card(
      color: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            buildInfoRow('Brokerage', 'per crore'),
            const SizedBox(height: 10),
            buildInfoRow('Margin Intraday', 'Turnover /'),
            const SizedBox(height: 10),
            buildInfoRow('Margin Holding', 'Turnover /'),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: WhiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: WhiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
