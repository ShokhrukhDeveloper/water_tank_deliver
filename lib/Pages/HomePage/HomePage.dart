import 'package:flutter/material.dart';

import '../Widgets/BottomNavBArWidget.dart';
import 'Pages/Account.dart';
import 'Pages/MyOrders.dart';
import 'Pages/Home.dart';

import 'Pages/Notification.dart' as N;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static final List<Widget> _pages=[const Home(), MyOrders(), N.Notification(), const Account()];
  static final List<String> _pagesTitle=[
    "Suv",
    "Cart",
    "Notification",
    "Account",
  ];
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pagesTitle[index]),
        centerTitle: true,
      ),
      body: _pages[index],
      bottomNavigationBar:  BottomNavBar(onChanged: (int index) {
        setState(() {
          this.index=index;
        });
      },),
    );
  }
}
