import 'package:flutter/material.dart';
class ProductItemCart extends StatefulWidget {
  const ProductItemCart({Key? key, required this.onTapPlus, required this.text, required this.onTapMinus,  this.url, required this.count, required this.price}) : super(key: key);
  final VoidCallback onTapPlus;
  final String text;
  final String? url;
  final num price;
  final String count;
  final VoidCallback onTapMinus;
  @override
  State<ProductItemCart> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemCart> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          Image.network(widget.url??"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLcjNkl2MXOmYuUPey2aOKWlLTS4Uz8tFUZXIxaejxdA&s",
            width: 60,
            height: 60,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent
                  ),
                ),
                Center(
                  child: Text("${widget.price} so'm",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                    ),

                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 130,
            height: 30,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.blue)
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                    onPressed: widget.onTapMinus,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text("-"),
                    )),
                Expanded(

                    child: Center(child: Text("${widget.count}",
                      style: const TextStyle(
                          color: Colors.blueAccent
                      ),
                    ))),
                FloatingActionButton(
                    onPressed: widget.onTapPlus,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: Text("+",
                        style: TextStyle(),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}