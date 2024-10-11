import 'package:flutter/material.dart';
import 'package:new_project/Widget/color.dart';

class FundsScreen extends StatefulWidget {
  const FundsScreen({super.key});

  @override
  State<FundsScreen> createState() => _FundsScreenState();
}

class _FundsScreenState extends State<FundsScreen> {
  // Sample data for the ListView
  final List<Map<String, String>> funds = [
    {'date': '2024-09-09 00:00:00', 'amount': '+697254.87'},
    {'date': '2024-09-08 00:00:00', 'amount': '+123456.78'},
    {'date': '2024-09-07 00:00:00', 'amount': '-5000.00'},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpeg'), // Update the path to the correct image
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: WhiteColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Funds',
            style: TextStyle(color: WhiteColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: funds.length + 1, // +1 for the divider
            separatorBuilder: (context, index) {
              return index < funds.length ? Divider(color: WhiteColor) : SizedBox(); // No divider after last item
            },
            itemBuilder: (context, index) {
              if (index == funds.length) {
                return SizedBox(); // Empty space for the last item
              }
              final fund = funds[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fund['date']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      fund['amount']!,
                      style: TextStyle(
                        color: fund['amount']!.startsWith('+') ? Colors.greenAccent : Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
