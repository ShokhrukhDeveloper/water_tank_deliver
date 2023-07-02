import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:water_tank_deliver/Pages/Widgets/CustomButton.dart';
showMCompleteModalSheet(BuildContext context,void Function(int tankCount) onTap)
{
showModalBottomSheet(
    enableDrag: true,
    isScrollControlled: true,
    context: context, builder: (c)=> ModalNumberPicker(onTap: onTap,));
}
class ModalNumberPicker extends StatefulWidget {
  const ModalNumberPicker({Key? key, required this.onTap}) : super(key: key);
  final Function(int tankCount) onTap;
  @override
  State<ModalNumberPicker> createState() => _ModalNumberPickerState();
}

class _ModalNumberPickerState extends State<ModalNumberPicker> {
  int _currentIntValue=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),

      height: MediaQuery.of(context).size.height/2,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text("Qaytarilgan baklashka sonini tanlang",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff0074B4),
            fontWeight: FontWeight.bold,
            fontSize: 22,

          ),
          ),
          const SizedBox(height:
          30,),
          NumberPicker(
            selectedTextStyle: const TextStyle(
              fontSize: 40,
              color: Colors.green
            ),
            value: _currentIntValue,
            minValue: 0,
            maxValue: 100,
            itemCount: 3,
            step: 1,
            itemHeight: 100,
            axis: Axis.horizontal,
            onChanged: (value) =>
                setState(() => _currentIntValue = value),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black26),
            ),
          ),
          const SizedBox(height:
          30,),
          CustomButton(text: "Yakunlash",
          onTap: (){
            Navigator.pop(context);
            widget.onTap(_currentIntValue);
          },
          color: Colors.green,
            magin: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
          )
        ],
      ),
    );
  }
}
