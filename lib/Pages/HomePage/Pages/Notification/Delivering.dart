import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:water_tank_deliver/Pages/HomePage/Pages/Notification/OrderItem.dart';
import '../../../../Data/Model/OrdersPagenated.dart';
import '/API/API.dart';
class DeliveringWidget extends StatefulWidget {
  const DeliveringWidget({Key? key}) : super(key: key);

  @override
  State<DeliveringWidget> createState() => _CreatedWidgetState();
}

class _CreatedWidgetState extends State<DeliveringWidget> {
  OrdersPagenated? ordersPagenated;
  Future<OrdersPagenated?> getData({int page=1,int limit=10})async
  {
    try{
      var result = await API.getDeliveringOrder(page: page,limit: limit);
      if(result is OrdersPagenated)
      {
        ordersPagenated=result;
        setState(() {
        });
      }
    }catch(e)
    {
      if (kDebugMode) {
        print("error occured at $getData error=$e");
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    if(ordersPagenated!=null) {
      return ListView.builder(
          itemCount: ordersPagenated?.data?.length??0,
          itemBuilder: (c,i)=> OrderItem(order: ordersPagenated!.data![i],));
    }
    return const Center(child: CircularProgressIndicator.adaptive(),);
  }
}
