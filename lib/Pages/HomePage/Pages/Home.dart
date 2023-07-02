
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:water_tank_deliver/API/API.dart';
import 'package:water_tank_deliver/Data/Extension/Extension.dart';
import 'package:water_tank_deliver/Data/Model/Company.dart';
import 'package:water_tank_deliver/Data/Model/OrdersPagenated.dart';
import 'package:water_tank_deliver/Data/Model/Product.dart';
import 'package:water_tank_deliver/Data/Urls/Urls.dart';
import 'package:water_tank_deliver/Pages/HomePage/Pages/MyOrders.dart';
import 'package:water_tank_deliver/Pages/HomePage/Pages/Notification/OrderItem.dart';
import 'package:water_tank_deliver/Pages/Widgets/ProductItem.dart';
import 'package:water_tank_deliver/Pages/Widgets/progress.dart';

import '../../../Data/Model/Order.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  OrdersPagenated? ordersPagenated;
  Future<void> getHomeData()async
  {
    var result =await API.getHomeData();
    if(result is OrdersPagenated){
      ordersPagenated=result;
    }else if(result is String)
     {
      if(mounted)ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result),backgroundColor: Colors.red,));
     }
    setState(() {

    });
  }
  Company? company;
  Future<void> getCompanyData()async{
  var result = await API.getCompanyData();
  if(result is Company)
    {
      company=result;
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomeData();
    // getCompanyData();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(ordersPagenated!=null)Expanded(child:
        ListView.builder(
            itemCount: ordersPagenated?.data?.length??0,
            itemBuilder: (c,i)=>OrderItem(
                order:ordersPagenated!.data![i],
              onTap: ()async
              {
                showProgress(context);
                await Future.delayed(const Duration(seconds: 3));
                try{
                  var result = await API.acceptOrder(orderId: ordersPagenated!.data![i].id!.toInt());
                Navigator.pop(context);
                if(result is Order)
                {
                  if(mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Muvafaqqiyatli qabul qilindi"),backgroundColor: Colors.green,));
                }
                else {
                  if(mounted)ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.toString()),backgroundColor: Colors.red,));
                }
                }catch(x){

                }


              },


            ))
        )
      ],
    );
  }
}
