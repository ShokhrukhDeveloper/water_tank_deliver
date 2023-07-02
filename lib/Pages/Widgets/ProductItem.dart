import 'package:flutter/material.dart';
class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({Key? key, required this.onTapAdd, required this.text,  this.url, required this.count, required this.price, required this.visiblity}) : super(key: key);
  final VoidCallback onTapAdd;
  final String text;
  final String? url;
  final num price;
  final String count;
  final bool visiblity;

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
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
          Container(
            width: 50,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(widget.url??""),
                fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(width: 20,),
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
          Visibility(
            visible: widget.visiblity,
            child: InkWell(
              onTap: widget.onTapAdd,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.blue)
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Center(child: Text("${widget.count}",
                          style: const TextStyle(
                              fontSize: 26,
                              color: Colors.blueAccent,
                          ),
                        ))),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
