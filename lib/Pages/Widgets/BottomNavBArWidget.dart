import 'package:flutter/material.dart';
class BottomNavBar extends StatefulWidget {
  final Function(int index) onChanged;
  const BottomNavBar({Key? key, required this.onChanged}) : super(key: key);


  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  static int index=0;
@override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (i){
        index=i;
        setState(()=>widget.onChanged(i));
      },
        currentIndex: index,
        items:  [
      BottomNavigationBarItem(icon: Icon(Icons.home,color: index==0? Colors.lightBlue: Colors.black,),label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_sharp,color: index==1? Colors.lightBlue: Colors.black,),label: "Cart"),
      BottomNavigationBarItem(icon: Icon(Icons.notifications_active,color: index==2? Colors.lightBlue: Colors.black,),label: "Notification"),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded,color: index==3? Colors.lightBlue: Colors.black,),label: "Account"),

    ]);
  }
}
