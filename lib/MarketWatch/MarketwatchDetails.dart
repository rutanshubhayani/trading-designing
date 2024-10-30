import 'package:flutter/material.dart';
import 'package:new_project/Widget/widget.dart';

class MarketwatchDetails extends StatefulWidget {
  final String tradeName;
  MarketwatchDetails({required this.tradeName});

  @override
  State<MarketwatchDetails> createState() => _MarketwatchDetailsState();
}

class _MarketwatchDetailsState extends State<MarketwatchDetails> with SingleTickerProviderStateMixin {
  TextEditingController OrderPriceController = TextEditingController();
  TextEditingController MarketLotsController = TextEditingController();
  TextEditingController OrderLotsController = TextEditingController();
  FocusNode OrderPriceFocusnode = FocusNode();
  FocusNode MarketLotsFocusnode = FocusNode();
  FocusNode OrderLotsFocusnode = FocusNode();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Trigger rebuild when tab changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    OrderPriceFocusnode.dispose();
    MarketLotsFocusnode.dispose();
    OrderLotsFocusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(widget.tradeName, style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close, color: Colors.white),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white70,
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
              controller: _tabController,
              children: [
                MarketTab(),
                OrderTab(),
              ],
            ),
          ),
          Divider(thickness: 1, color: Colors.grey),
          Expanded(
            flex: _tabController.index == 0 ? 3 : 2, // Check if the tab index is initialized
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
    );
  }

  Widget MarketTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildInfoRow('Lots', '1', MarketLotsController, MarketLotsFocusnode),
Spacer(),
          Row(
            children: [
              Expanded(
                child: buildOrderButton(
                  ["Sell @", "5775"],
                  Colors.red,
                ),
              ),
              SizedBox(width: 10,),
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
              FocusScope.of(context).requestFocus(nextFocusNode);
            },
          ),
        ),
      ],
    );
  }

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

  Widget buildInfoGrid(String label1, String value1, String label2, String value2, String label3, String value3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: buildInfoCell(label1, value1),
        ),
        Expanded(
          child: buildInfoCell(label2, value2),
        ),
        Expanded(
          child: buildInfoCell(label3, value3),
        ),
      ],
    );
  }

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
