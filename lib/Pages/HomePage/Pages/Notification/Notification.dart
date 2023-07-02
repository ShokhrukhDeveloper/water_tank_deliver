import 'package:flutter/material.dart';
import 'package:water_tank_deliver/Pages/HomePage/Pages/Notification/Created.dart';


import 'Completed.dart';
import 'Delivering.dart';

class Notification extends StatelessWidget {
   Notification({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar:  TabBar(
            indicator: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlueAccent
            ),
            unselectedLabelColor: Colors.blue,
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            labelStyle: const TextStyle(
              color: Colors.green
            ),
            tabs: const[
              Tab(
                child: Text("Yangi"),
              ),
              Tab(
                child: Text("Yo'lda"),
              ),
              Tab(
                child: Text("Yetkazilgan"),
              ),
            ],
          ),
          body: const TabBarView(children: [
            CreatedWidget(),
            DeliveringWidget(),
            CompletedWidget(),



          ]
        )));
  }
}
