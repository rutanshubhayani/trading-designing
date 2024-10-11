import 'package:flutter/material.dart';
import 'package:new_project/Widget/color.dart';

class MarketwatchDetails extends StatefulWidget {
  final String tradeName;
  MarketwatchDetails({required this.tradeName});

  @override
  State<MarketwatchDetails> createState() => _MarketwatchDetailsState();
}

class _MarketwatchDetailsState extends State<MarketwatchDetails> {
  TextEditingController OrderPriceController = TextEditingController();
  TextEditingController MarketLotsController = TextEditingController();
  TextEditingController OrderLotsController = TextEditingController();
  FocusNode OrderPriceFocusnode = FocusNode();
  FocusNode MarketLotsFocusnode = FocusNode();
  FocusNode OrderLotsFocusnode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    OrderPriceFocusnode.dispose();
    MarketLotsFocusnode.dispose();
    OrderLotsFocusnode.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: Market and Order
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(widget.tradeName, style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              onPressed: () {
                // Handle close action
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, color: Colors.white),
            ),
          ],
          bottom:TabBar(
            indicator: BoxDecoration(
              color: Colors.white, // Adjust to your desired color
              borderRadius: BorderRadius.circular(20),
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white70,
            dividerColor: Colors.transparent,
            tabs: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0,), // Add horizontal padding
                child: Tab(
                  text: "Market",
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0), // Add horizontal padding
                child: Tab(
                  text: "Order",
                ),
              ),
            ],
          )

        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  // Market Tab content
                  MarketTab(),
                  // Order Tab content
                  OrderTab(),
                ],
              ),
            ),
            // Trade details section at the bottom
            Divider(thickness: 1, color: Colors.grey),
            Expanded(
              flex: 2, // Give space for trade details
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    buildInfoGrid('Bid', '5775', 'Ask', '5777', 'Last', '5777'),
                    buildInfoGrid('High', '5899', 'Low', '5760', 'Change', '5777'),
                    buildInfoGrid('Open', '5833', 'Volume', '27291', 'Last Traded Qty', '5777'),
                    buildInfoGrid('Atp', '5843.84', 'Last', '5786', 'Open Interest', '5777'),
                    buildInfoGrid('Lot Size', '10', 'Lot Size', '12163', 'Pre. Close', '5777'),
                    buildInfoGrid('Bid Qty', '214', 'Ask Qty', '1092', '', ''),
                    buildInfoGrid('Upper Circuit', '6040', 'Lower Circuit', '5576', '', ''),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the Market Tab
  Widget MarketTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildInfoRow('Lots', '1',MarketLotsController,MarketLotsFocusnode),
          SizedBox(height: 10),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: buildOrderButton(
                  ["Sell @", "5775"],
                  Colors.red,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: buildOrderButton(
                  ["Buy @", "5777"],
                  Colors.green,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  // Widget for the Order Tab
  Widget OrderTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildInfoRow(
            'Lots',
            '1',
            OrderLotsController,
            OrderLotsFocusnode,
            nextController: OrderPriceController,
            nextFocusNode: OrderPriceFocusnode,
          ),
          SizedBox(height: 10),
          buildInfoRow(
            'Price',
            '',
            OrderPriceController,
            OrderPriceFocusnode,
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: buildOrderButton(
                  ["Sell @", "5775"],
                  Colors.red,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: buildOrderButton(
                  ["Buy @", "5777"],
                  Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget to build a row with label and value
  Widget buildInfoRow(String label, String value, TextEditingController controller, FocusNode focusNode, {TextEditingController? nextController, FocusNode? nextFocusNode}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 18, color: Colors.white)),
        Container(
          width: 100,
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: value,
              hintStyle: TextStyle(color: Colors.white70),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(color: Colors.white),
            onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(nextFocusNode); // Move focus to the next field
            },
          ),
        ),
      ],
    );
  }


  // Widget to build the order button
  Widget buildOrderButton(List<String> texts, Color color) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle order placement
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: texts
              .map((text) => Text(text, style: TextStyle(fontSize: 16, color: Colors.white)))
              .toList(),
        ),
      ),
    );
  }

  // Widget to build the trade info grid
  Widget buildInfoGrid(String label1, String value1, String label2, String value2, String label3, String value3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left-aligned cell
        Expanded(
          child: buildInfoCell(label1, value1),
        ),
        // Center-aligned cell
        Expanded(
          child: buildInfoCell(label2, value2),
        ),
        // Right-aligned cell
        Expanded(
          child: buildInfoCell(label3, value3),
        ),
      ],
    );
  }

  // Widget to build a single trade info cell
  Widget buildInfoCell(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      ],
    );
  }
}

