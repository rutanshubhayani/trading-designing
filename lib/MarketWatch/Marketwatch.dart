import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_project/Account/Account.dart';
import 'package:new_project/Deposit-Withdraw/Deposit-Withdraw.dart';
import 'package:new_project/Portfolio/Portfolio.dart';
import 'package:new_project/MarketWatch/MarketwatchDetails.dart';
import 'package:new_project/Trade/TradesScreen.dart';
import 'package:new_project/Widget/color.dart';



class MarketItem {
  final String name;
  final String date;
  final String change;
  final String high;
  final String current;
  final String low;
  final String open;

  MarketItem(this.name, this.date, this.change, this.high, this.current, this.low, this.open);
}

class MarketWatchScreen extends StatefulWidget {


  @override
  _MarketWatchScreenState createState() => _MarketWatchScreenState();
}



class _MarketWatchScreenState extends State<MarketWatchScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    MarketWatchScreen(),
    TradesScreen(),
    DepositWithdrawScreen(),
    PortfolioScreen(),
    AccountScreen(),
  ];
  late TabController _tabController;
  TextEditingController searchController = TextEditingController();
  String _searchQuery = '';
  String _sortType = 'name';
  bool _showPositiveChangeOnly = false;
  DateTime? _startDate;
  DateTime? _endDate;

  // Sample market data
  List<MarketItem> _marketItems = [
    MarketItem('ALUMINIUM', '2024-09-30', '4.05', '229.1', '228.85', '225.3', '226.9'),
    MarketItem('COPPER', '2024-09-30', '3.10', '805.3', '801.7', '797.3', '803.4'),
    MarketItem('CRUDEOIL', '2024-09-19', '-27.00', '5905', '5767', '5752', '5827'),
    MarketItem('GOLD', '2024-10-04', '686.00', '73613', '73510', '73081', '73128'),
    MarketItem('SILVER', '2024-12-05', '2149.00', '89825', '89144', '87352', '87606'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchQuery = '';
      searchController.clear();
    });
  }

  void _openFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Filters', style: Theme.of(context).textTheme.titleLarge),
                  ListTile(
                    title: const Text('Sort by Name'),
                    leading: Radio<String>(
                      value: 'name',
                      groupValue: _sortType,
                      onChanged: (value) {
                        setModalState(() {
                          _sortType = value!;
                        });
                      },
                    ),
                    onTap: () {
                      setModalState(() {
                        _sortType = 'name';
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Sort by Change'),
                    leading: Radio<String>(
                      value: 'change',
                      groupValue: _sortType,
                      onChanged: (value) {
                        setModalState(() {
                          _sortType = value!;
                        });
                      },
                    ),
                    onTap: () {
                      setModalState(() {
                        _sortType = 'change';
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Show only positive change'),
                    value: _showPositiveChangeOnly,
                    onChanged: (value) {
                      setModalState(() {
                        _showPositiveChangeOnly = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Trigger the filter update
                        setState(() {}); // This triggers a rebuild in the parent widget
                        Navigator.pop(context);
                      },
                      child: const Text('Apply'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  List<MarketItem> get filteredMarketItems {
    List<MarketItem> items = _marketItems;

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      items = items.where((item) => item.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    }

    // Filter by positive change
    if (_showPositiveChangeOnly) {
      items = items.where((item) {
        double? changeValue = double.tryParse(item.change);
        return changeValue != null && changeValue > 0;
      }).toList();
    }



    // Sort items based on sort type
    if (_sortType == 'name') {
      items.sort((a, b) => a.name.compareTo(b.name));
    } else if (_sortType == 'change') {
      items.sort((a, b) => double.parse(a.change).compareTo(double.parse(b.change)));
    }

    return items;
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
          title: Text('Marketwatch', style: TextStyle(color: WhiteColor, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.black54,
          bottom: TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Colors.white,
            controller: _tabController,
            tabs: [
              Tab(child: Text('NSE Futures', textAlign: TextAlign.center, style: TextStyle(fontSize: 13))),
              Tab(child: Text('MCX Futures', textAlign: TextAlign.center, style: TextStyle(fontSize: 13))),
              Tab(child: Text('Options', textAlign: TextAlign.center, style: TextStyle(fontSize: 13))),
              Tab(child: Text('Comex', textAlign: TextAlign.center, style: TextStyle(fontSize: 13))),
              Tab(child: Text('Forex & Crypto', textAlign: TextAlign.center, style: TextStyle(fontSize: 13))),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchController,
                      onChanged: _onSearchChanged,
                      decoration: InputDecoration(
                        hintText: 'Search & Add',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: _searchQuery.isNotEmpty
                            ? IconButton(
                          onPressed: _clearSearch,
                          icon: Icon(Icons.clear),
                        )
                            : null,
                        filled: true,
                        fillColor: WhiteColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.filter_list, color: WhiteColor),
                    onPressed: _openFilterBottomSheet,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  marketListView(filteredMarketItems),
                  marketListView(filteredMarketItems),
                  marketListView(filteredMarketItems),
                  marketListView(filteredMarketItems),
                  marketListView(filteredMarketItems),
                ],
              ),
            ),
          ],
        ),
/*        bottomNavigationBar: Container(
          color: Colors.transparent, // Background color of the bottom navigation bar
          height: 70,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Tooltip(
                  message: 'Watchlist',
                  child: InkWell(
                    onTap: () {
                      Get.to(() => MarketWatchScreen());
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.remove_red_eye,size: 25, color: WhiteColor,),
                        Text('Watchlist', style: TextStyle(fontSize: 12,color: WhiteColor)),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 1,

                child: Tooltip(
                  message: 'Trades',
                  child: InkWell(
                    onTap: ()
                    {
                      Get.to(() =>TradesScreen());

                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.my_library_books_outlined,size: 25,color: WhiteColor,),
                        Text('Trades',style: TextStyle(fontSize: 12,color: WhiteColor,),),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Tooltip(
                  message: 'Deposit/Withdraw',
                  child: InkWell(
                    onTap: () {
                      Get.to(() => DepositWithdrawScreen());

                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.currency_rupee,size: 25,color: WhiteColor,),
                        Flexible(child: Text('Deposit/Withdraw',style: TextStyle(fontSize: 12,color: WhiteColor,),)),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 1,

                child: Tooltip(
                  message: 'Portfolio',
                  child: InkWell(
                    onTap: () {
                      Get.to(() => PortfolioScreen());

                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.work_outline_rounded,size: 25,color: WhiteColor,),
                        Text('Portfolio',style: TextStyle(fontSize: 12,color: WhiteColor,),),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,

                child: Tooltip(
                  message: 'Account',
                  child: InkWell(
                    onTap: () {
                      Get.to(() => AccountScreen());
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person,size: 20,color: WhiteColor,),
                        Text('Account',style: TextStyle(fontSize: 12,color: WhiteColor,),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),*/
      ),
    );
  }


  Widget marketListView(List<MarketItem> items) {
    return Scrollbar(
      scrollbarOrientation: ScrollbarOrientation.right,
      child: ListView(
        children: items.map((item) {
          return Column(
            children: [
              marketItem(item),
              Divider(color: WhiteColor),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget marketItem(MarketItem item) {
    Color changeColor = double.tryParse(item.change) != null && double.parse(item.change) < 0
        ? Colors.red
        : Colors.green;

    return ListTile(
      title: Text(item.name, style: TextStyle(color: WhiteColor, fontWeight: FontWeight.bold)),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.date, style: TextStyle(color: WhiteColor)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Chg: ${item.change}', style: TextStyle(color: changeColor)),
                  SizedBox(width: 8),
                  Text('H: ${item.high}', style: TextStyle(color: WhiteColor, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          Spacer(flex: 3),
          Column(
            children: [
              Text(item.current, style: TextStyle(color: WhiteColor, fontWeight: FontWeight.bold, fontSize: 18)),
              Text('L: ${item.low}', style: TextStyle(color: WhiteColor)),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Column(
            children: [
              Text(item.current,
                  style: TextStyle(
                      color: WhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)), // Use WhiteColor
              Text('L: ${item.low}',
                  style: TextStyle(color: WhiteColor)), // Use WhiteColor
            ],
          ),
        ],
      ),
      onTap: (){
        Get.to(() => MarketwatchDetails(tradeName: item.name,));
      },
    );
  }

}
