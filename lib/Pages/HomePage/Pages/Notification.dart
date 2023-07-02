import 'package:flutter/material.dart';


class Notification extends StatelessWidget {
   Notification({Key? key}) : super(key: key);


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
              style: TextStyle(
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
                         child: Center(child: Text("Suv")),
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
                       child: Center(child: Text("Soni")),
                     ),
                     Container(
                       decoration: const BoxDecoration(
                           border: Border(
                               right: BorderSide(color: Colors.blue),
                               bottom: BorderSide(color: Colors.blue)
                           )
                       ),
                       width: (MediaQuery.of(context).size.width-25)*0.20,
                       child: Center(child: Text("Narxi")),
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(color: Colors.blue),

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

                            )
                        ),
                        width: (MediaQuery.of(context).size.width-25)*0.10,
                        child: Center(child: Text("Soni")),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                right: BorderSide(color: Colors.blue),

                            )
                        ),
                        width: (MediaQuery.of(context).size.width-25)*0.20,
                        child: const Center(child: Text("Narxi")),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(


                            )
                        ),
                        width: (MediaQuery.of(context).size.width-25)*0.35,
                        child: const Center(child: Text("Summa")),
                      ),
                    ],
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
