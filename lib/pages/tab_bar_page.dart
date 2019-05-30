import 'package:flutter/material.dart';
import 'home_page.dart';
import 'list_page.dart';

class TabBarWidget extends StatefulWidget {
  @override
  createState() => TabBarWidgetState();
}

class TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {

  List<BottomNavigationBarItem> _tabItems;
  TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabItems = [
      BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.account_balance)),
      BottomNavigationBarItem(title: Text('列表'), icon: Icon(Icons.announcement)),
    ];
    _tabController = TabController(vsync: this, length: _tabItems.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          HomePageWidget(),
          ListPageWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _tabItems,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _tabController.animateTo(index);
        },
      ),
    );
  }

}
