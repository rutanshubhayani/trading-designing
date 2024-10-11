import 'package:flutter/material.dart';
import 'package:new_project/Widget/color.dart'; // Assuming you have a color file where 'WhiteColor' is defined

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
          centerTitle: true,
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: WhiteColor,
            ),
          ),
          title: Text(
            'Notifications',
            style: TextStyle(color: WhiteColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          itemCount: 10, // Number of notifications
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0) , // Reduced vertical padding
              child: Card(
                color: Colors.grey[900], // Dark card color
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Low Margin Alert',
                        style: TextStyle(
                          color: WhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '19-Sep-2024 11:20 am', // You can use dynamic date/time
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0),
                      Text(
                        'Your M2M Balance has gone below 30% of your ledger balance.',
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
