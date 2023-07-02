import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_tank_deliver/Data/Model/Order.dart';
import 'package:water_tank_deliver/Pages/Widgets/CustomButton.dart';


class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.order, this.onTap, this.buttonText, this.buttonTextStyle, this.buttonColor, this.buttonWidth, this.buttonHeight}) : super(key: key);
  final Order order;
  final VoidCallback? onTap;
  final String? buttonText;
  final TextStyle? buttonTextStyle;
  final Color? buttonColor;
  final double? buttonWidth;
  final double? buttonHeight;

static const style=TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Color(0xff0074B4)
);
static final  format=DateFormat("yyyy.MM.dd - hh:mm");
  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xff0074B4).withOpacity(0.4))
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Buyutrma №: ${order.id}", style: style),
          Text("Manzil: ${order.address}", style: style),
          Text("Suv: ${order.productName}", style: style),
          Text("Soni: ${order.quantity}", style: style),
          Text("Narxi: ${order.price}", style: style),
          if(order.createdAt!=null)Text("Yaratildi: ${format.format(DateTime.parse(order.createdAt!))}", style: style),
          if(order.acceptedAt!=null)Text("Qabul qilindi: ${format.format(DateTime.parse(order.acceptedAt!))}", style: style),
          if(order.deliveredAt!=null)Text("Yakunlandi: ${format.format(DateTime.parse(order.deliveredAt!))}", style: style),
          const SizedBox(height: 5,),
          Text("Umumiy narxi: ${order.totalPrice} so’m",
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xff0074B4)
          ),
          ),
          const SizedBox(height: 5,),
          CustomButton(
            onTap: onTap,
              height:buttonHeight??42 ,
              styleText: buttonTextStyle,
              width: buttonWidth,
              color: buttonColor,
              text:  buttonText??"QABUL QILISH")
        ],
      ),

    );
  }
}
