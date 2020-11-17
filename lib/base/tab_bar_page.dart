import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_page.dart';
import 'package:flutter_app/message/message_page.dart';
import 'package:flutter_app/mine/mine_page.dart';

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
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
      BottomNavigationBarItem(icon: Icon(Icons.mail), label: "消息"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的")
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
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePageWidget(),
          MessagePageWidget(),
          MinePageWidget()
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
