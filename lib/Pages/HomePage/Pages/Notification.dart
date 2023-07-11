import 'package:flutter/material.dart';
import 'package:water_tank_deliver/API/API.dart';
import 'package:water_tank_deliver/Data/Model/Statistics.dart';


class Notification extends StatefulWidget {
    Notification({Key? key}) : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
Future<void> getData()async{
var result = await API.getStatisticsToday();
if(result is Statistics){
  statistics=result;
  setState(() {

  });
}
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
Statistics? statistics;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Today’s order".toUpperCase(),
              style: const TextStyle(
               fontWeight: FontWeight.bold ,
                fontSize: 20
              ),
              ),
            ),
            Container(

             width: double.infinity,
             decoration: BoxDecoration(
               border: Border.all(color: Color(0xff0074B4))
             ),
              child:  Column(
                children: [
                  Row(
                    children: [
                     Expanded(
                       child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.blue),
                              bottom: BorderSide(color: Colors.blue)
                          )
                        ),
                         width: double.infinity,
                         child: const Center(child: Text("Suv")),
                       ),
                     ),
                     Container(
                       decoration: const BoxDecoration(
                           border: Border(
                               right: BorderSide(color: Colors.blue),
                               bottom: BorderSide(color: Colors.blue)
                           )
                       ),
                       width: (MediaQuery.of(context).size.width-25)*0.10,
                       child: const Center(child: Text("Soni")),
                     ),
                     Container(
                       decoration: const BoxDecoration(
                           border: Border(
                               right: BorderSide(color: Colors.blue),
                               bottom: BorderSide(color: Colors.blue)
                           )
                       ),
                       width: (MediaQuery.of(context).size.width-25)*0.20,
                       child: const Center(child: Text("Narxi")),
                     ),
                     Container(
                       decoration: const BoxDecoration(
                           border: Border(

                               bottom: BorderSide(color: Colors.blue)
                           )
                       ),
                       width: (MediaQuery.of(context).size.width-25)*0.35,
                       child: const Center(child: Text("Summa")),
                     ),
                    ],
                  ),
                  if(statistics!=null)
                   ...statistics!.delivered!.map((e) => Container(
                     decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                     child: Row(
                       children: [
                         Expanded(
                           child: Container(
                             decoration: const BoxDecoration(
                                 border: Border(
                                   right: BorderSide(color: Colors.blue),

                                 )
                             ),
                             width: double.infinity,
                             child:  Center(child: Text("${e.productName}")),
                           ),
                         ),
                         Container(
                           decoration: const BoxDecoration(
                               border: Border(
                                 right: BorderSide(color: Colors.blue),

                               )
                           ),
                           width: (MediaQuery.of(context).size.width-25)*0.10,
                           child:  Center(child: Text("${e.quantity}")),
                         ),
                         Container(
                           decoration: const BoxDecoration(
                               border: Border(
                                 right: BorderSide(color: Colors.blue),
                               )),
                           width: (MediaQuery.of(context).size.width-25)*0.20,
                           child:  Center(child: Text("${e.price}")),
                         ),
                         Container(
                           decoration: const BoxDecoration(
                               border: Border(


                               )
                           ),
                           width: (MediaQuery.of(context).size.width-25)*0.35,
                           child:  Center(child: Text("${e.totalPrice}")),
                         ),
                       ],
                     ),
                   ),)

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
