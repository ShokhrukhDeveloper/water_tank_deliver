import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Data/Storage/LocalStorage.dart';
import '../../SignInPage/SignInPage.dart';


class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: ElevatedButton(
       style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red),

       // maximumSize: MaterialStatePropertyAll<Size>(Size.fromWidth(110))
       ),

        onPressed: (){
         LocalStorage.removeToken();
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c)=>const SignInPage()), (route) => false);
        }, child: const Row(
      mainAxisSize: MainAxisSize.min,
          children: [
            Text("Chiqish"),
            SizedBox(width: 10,),
            Icon(Icons.logout,),
          ],
        )),);
  }
}
