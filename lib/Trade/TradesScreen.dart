import 'package:flutter/material.dart';
import 'package:new_project/Widget/widget.dart';

class TradesScreen extends StatefulWidget {
  const TradesScreen({super.key});

  @override
  State<TradesScreen> createState() => _TradesScreenState();
}

class _TradesScreenState extends State<TradesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Trades',
            style: TextStyle(
              color: WhiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black54,
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Pending'),
              Tab(text: 'Active'),
              Tab(text: 'Closed'),
            ],
            labelColor: WhiteColor,
            unselectedLabelColor: Colors.white54,
            indicatorColor: WhiteColor,
            dividerColor: Colors.transparent,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            PendingTradesScreen(),  // Pending screen content
            ActiveTradesScreen(),   // Active screen content
            ClosedTradesScreen(),   // Closed screen content
          ],
        ),
      ),
    );
  }
}

class PendingTradesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildTradeList();
  }

  Widget _buildTradeList() {
    return ListView.builder(
      itemCount: 4, // Replace with dynamic trade count
      itemBuilder: (context, index) {
        return _buildTradeCard(index);
      },
    );
  }

  Widget _buildTradeCard(int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildTradeInfo(),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '2024-09-16 00:00:00',
                    style: TextStyle(color: WhiteColor),
                  ),
                  Text('705.4',
                      style: TextStyle(
                          color: WhiteColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                  _buildCloseTradeButton(),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Holding Margin Req. '),
                        TextSpan(
                          text: '7054',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(color: WhiteColor),
        ],
      ),
    );
  }

  Widget _buildTradeInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTradeTag(),
        SizedBox(width: 5),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              'HDFCLIFE24SEPFUT',
              style: TextStyle(
                  color: WhiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          child: Text(
            'Bought by Admin',
            style: TextStyle(color: WhiteColor),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: 'Margin used: '),
              TextSpan(
                  text: '7054',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTradeTag() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            'Bought X 10000',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Market',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCloseTradeButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        onPressed: () {
          // Handle close trade action
        },
        child: Text(
          'Close Trade',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}












// Screen for Active Trades
class ActiveTradesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add Close Trade button at the top
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    // Handle close all trades action
                  },
                  child: Text(
                    'Close Active Trades MCX',
                    textAlign: TextAlign.center, // Center text
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    // Handle close all trades action
                  },
                  child: Text(
                    'Close Active Trades Equity',
                    textAlign: TextAlign.center, // Center text
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
,

        // Trade list goes below the button
        Expanded(
          child: ListView.builder(
            itemCount: 4, // Replace with dynamic trade count
            itemBuilder: (context, index) {
              return _buildTradeCard(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTradeCard(int index) {
    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end, // Aligns the entire column to the right
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // Aligns Row's children to the right
            children: [
              _buildTradeInfo(),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end, // Ensures inner elements are right-aligned
                children: [
                  Text(
                    '2024-09-16 00:00:00',
                    style: TextStyle(color: WhiteColor),
                  ),
                  Text(
                    '705.4',
                    style: TextStyle(
                        color: WhiteColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  _buildCloseTradeButton(),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Holding Margin Req. ',
                        ),
                        TextSpan(
                          text: '7054',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(color: WhiteColor),
        ],
      ),
    );
  }

  Widget _buildTradeInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTradeTag(),
        SizedBox(width: 5),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              'HDFCLIFE24SEPFUT',
              style: TextStyle(
                  color: WhiteColor, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          child: Text(
            'Bought by Admin',
            style: TextStyle(color: WhiteColor),
          ),
        ),
        RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Margin used: ',
              ),
              TextSpan(
                  text: '7054',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))
            ]))
      ],
    );
  }

  Widget _buildTradeTag() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            'Bought X 10000',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Market',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCloseTradeButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        onPressed: () {
          // Handle close trade action
        },
        child: Text(
          'Close Trade',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}








class ClosedTradesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Trade list goes below the button
        Expanded(
          child: ListView.builder(
            itemCount: 4, // Replace with dynamic trade count
            itemBuilder: (context, index) {
              return _buildTradeCard(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTradeCard(int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end, // Aligns the entire column to the right
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // Aligns Row's children to the right
            children: [
              _buildTradeInfo(),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end, // Ensures inner elements are right-aligned
                children: [
                  Text(
                    '2024-09-16 00:00:00',
                    style: TextStyle(color: WhiteColor),
                  ),
                  Text(
                    '705.4',
                    style: TextStyle(
                        color: WhiteColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  _buildCloseTradeButton(),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Holding Margin Req. ',
                        ),
                        TextSpan(
                          text: '7054',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(color: WhiteColor),
        ],
      ),
    );
  }

  Widget _buildTradeInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTradeTag(),
        SizedBox(width: 5),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              'HDFCLIFE24SEPFUT',
              style: TextStyle(
                  color: WhiteColor, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          child: Text(
            'Bought by Admin',
            style: TextStyle(color: WhiteColor),
          ),
        ),
        RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Margin used: ',
              ),
              TextSpan(
                  text: '7054',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))
            ]))
      ],
    );
  }

  Widget _buildTradeTag() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            'Bought X 10000',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Market',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCloseTradeButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        onPressed: () {
          // Handle close trade action
        },
        child: Text(
          'Close Trade',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

