import 'package:flutter/material.dart';
import '../Widget/widget.dart'; // Assuming this contains your custom color definitions

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpeg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Portfolio',
            style: TextStyle(
                color: WhiteColor, // Assuming WhiteColor is defined in 'widget.dart'
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black54,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildPortfolioSummary(),
              _buildTradesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPortfolioSummary() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          /*Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSummaryRow('Opening Bal:', '697254.87'),
              _buildSummaryRow('Ledger Bal:', '2765122'),
              _buildSummaryRow('Credits:', '0'),
              _buildSummaryRow('Withdrawals:', '0'),
              _buildSummaryRow('Margin Avail:', '2682048'),
              _buildSummaryRow('Margin Used:', '83073'),
              _buildSummaryRow('Active P/L:', '0'),
              _buildSummaryRow('Settled P/L:', '2065059.01'),
              _buildSummaryRow('Net P/L:', '2065059'),
              _buildSummaryRow('M2M:', '2765122'),
            ],
          ),*/ // All fields in one line
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSummaryRow('Opening Bal:', '697254.87'),
                _buildSummaryRow('Ledger Bal:', '2765122'),
                _buildSummaryRow('Credits:', '0'),
                _buildSummaryRow('Withdrawals:', '0'),
                _buildSummaryRow('Margin Avail:', '2682048'),
              ],
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSummaryRow('Margin Used:', '83073'),
                _buildSummaryRow('Active P/L:', '0'),
                _buildSummaryRow('Settled P/L:', '2065059.01'),
                _buildSummaryRow('Net P/L:', '2065059'),
                _buildSummaryRow('M2M:', '2765122'),
              ],
            ),
          ),
        ],
      )

    );
  }



  Widget _buildSummaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildTradesList() {
    return Column(
      children: [
        _buildTradeItem(
          'BANKNIFTY24SEPFUT',
          '25959',
          '500',
          '51917',
          '51917',
        ),
        _buildTradeItem(
          'HDFCLIFE24SEPFUT',
          '17635',
          '25000',
          '705.4',
          '705.4',
        ),
        _buildTradeItem(
          'MANAPPURAM24SEPFUT',
          '2120',
          '10000',
          '212',
          '212',
        ),
        _buildTradeItem(
          'TATACOMM24SEPFUT',
          '32929',
          '16000',
          '2058.05',
          '2058.05',
        ),
        _buildTradeItem(
          'TATAPOWER24SEPFUT',
          '4431',
          '10000',
          '443.1',
          '443.1',
        ),
      ],
    );
  }

  Widget _buildTradeItem(String tradeName, String margin, String boughtQty, String boughtAt, String cmp) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tradeName,
                style: TextStyle(color: WhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              RichText(text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'CMP: ',
                        style: TextStyle(
                            color: WhiteColor
                        )
                    ),
                    TextSpan(
                        text: '$cmp',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: WhiteColor,
                            fontSize: 16
                        )
                    )
                  ]
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: RichText(text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Margin: ',
                      style: TextStyle(
                        color: Colors.white70
                      )
                    ),
                    TextSpan(
                      text: '$margin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: WhiteColor,
                        fontSize: 16
                      )
                    )
                  ]
                )),
              ),
              Text('0', style: TextStyle(color: Colors.greenAccent, fontSize: 14)),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  onPressed: () {
                    // Add your close trade logic here
                  },
                  child: Text(
                    'Close Trades',
                    style: TextStyle(color: WhiteColor),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Bought: ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        TextSpan(
                          text: '$boughtQty ',
                          style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        TextSpan(
                          text: '@ ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        TextSpan(
                          text: '$boughtAt',
                          style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                ],
              )
            ],
          ),
          Divider(color: WhiteColor),
        ],
      ),
    );
  }
}
