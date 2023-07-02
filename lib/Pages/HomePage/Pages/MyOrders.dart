import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../API/API.dart';
import '../../../Data/Model/Company.dart';
import '../../../Data/Model/Order.dart';
import '../../../Data/Model/OrdersPagenated.dart';
import '../../../Data/Model/Product.dart';
import '../../Widgets/ModalBottomSheet.dart';
import '../../Widgets/ProductItemCart.dart';
import '../../Widgets/progress.dart';
import 'Notification/OrderItem.dart';

class MyOrders extends StatefulWidget {
  MyOrders({Key? key}) : super(key: key);
  static final cart=<Product>[].obs;

  @override
  State<MyOrders> createState() => _CartState();
}

class _CartState extends State<MyOrders> {
  OrdersPagenated? ordersPagenated;
  Future<void> getAcceptedOrder()async
  {
    var result = await API.getAcceptedOrder();
    if(result is OrdersPagenated){
      ordersPagenated=result;
    }else if(result is String)
    {
      if(mounted)ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result),backgroundColor: Colors.red,));
    }
    progress=false;
    setState(() {
    });
  }

  Company? company;
  Future<void> completeAcceptedOrder({required int  orderId,required int tankCount})async{
    showProgress(context);
    var result = await API.completeOrder(orderId: orderId, tankCount: tankCount);
    await Future.delayed(Duration(seconds: 3));
    if(mounted)Navigator.pop(context);
    if(result is Company)
    {
      if(mounted)ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Buyurtma muvafaqqiyatli yakunlandi"),backgroundColor: Colors.green,));

    }else if(result is String)
      {
        if(mounted)ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result),backgroundColor: Colors.red,));
      }
    setState(() {

    });
    progress=true;
    await Future.delayed(const Duration(seconds: 2));
    getAcceptedOrder();
  }
  bool progress=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAcceptedOrder();

  }
  @override
  Widget build(BuildContext context) {
    if(ordersPagenated?.data?.isEmpty??false) {
      return
      const Center(
        child: Icon(Icons.no_backpack,color: Colors.green,
          size: 36,),
      );
    }


    return progress? const Center(child: CircularProgressIndicator.adaptive(),)
        : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if(ordersPagenated!=null)Expanded(child:
        ListView.builder(
            itemCount: ordersPagenated?.data?.length??0,
            itemBuilder: (c,i)=>OrderItem(
              order:ordersPagenated!.data![i],
              buttonHeight: 42,
              buttonText: "Yetkazildi",

              buttonColor: const Color(0xff34A853),
              onTap:()=> showMCompleteModalSheet(context,(int tank){
                completeAcceptedOrder(orderId: ordersPagenated!.data![i].id!.toInt(), tankCount: tank);
              }),



            ))),


      ],
    );
  }
}
