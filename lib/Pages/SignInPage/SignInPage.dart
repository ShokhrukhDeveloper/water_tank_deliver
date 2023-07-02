import 'package:flutter/material.dart';
import 'package:water_tank_deliver/API/API.dart';
import 'package:water_tank_deliver/Data/Model/Token.dart';
import 'package:water_tank_deliver/Data/Storage/LocalStorage.dart';
import 'package:water_tank_deliver/Pages/Widgets/InputWidget.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:water_tank_deliver/Pages/Widgets/progress.dart';
import '../../Data/Model/SignData.dart';
import '../HomePage/HomePage.dart';
import '../Widgets/CustomButton.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController? controllerPhone;
  TextEditingController? controllerPassword;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerPassword=TextEditingController();
    controllerPhone=TextEditingController();
  }

  Future<void> login()async{
    showProgress(context);
    try{
      var phone= controllerPhone?.text.replaceAll("(", "").replaceAll(")", "").replaceAll("-", "");
      var result = await API.loginDeliver(phone:phone??"", password: controllerPassword?.text??"");
      if(result is Token)
        {
          LocalStorage.setToken(token: result.accessToken!);
          print(result.accessToken);
          print(result.refreshToken);
          print(result.expired);
          await Future.delayed(const Duration(seconds: 2));
          Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>const HomePage()));
        }
    }catch(e){

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30,),
        child: SingleChildScrollView(
          child: SizedBox(
          height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png",height: 300,width: 300,),
                InputWidget(title: "Phone",
                  controller: controllerPhone,
                  formatter: [
                    MaskedInputFormatter('+###(##)-###-##-##')
                  ],
                ),
                const SizedBox(height: 20,),
                InputWidget(title: "password",
                  controller: controllerPassword,
                  isPassword: true,
                ),
                Align(alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: (){},
                  child: Text("Forgot Password ?",
                  style: TextStyle(color: Color(0xff0074B4).withOpacity(0.60)),
                  ),
                ),
                ),
                const SizedBox(height: 30,),
                CustomButton(
                  onTap: login,
                  text: 'Login',),
                // InkWell(
                //
                //   child: Container(
                //     width: double.infinity,
                //     height: 56,
                //
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(28),
                //       color: Color(0xff0074B4)
                //     ),
                //     child: Center(
                //       child: Text("Login",
                //       style: TextStyle(
                //         fontSize: 18,
                //         color: Colors.white,
                //         fontWeight: FontWeight.w600
                //       ),
                //
                //       ),
                //     ),
                //   ),
                // ),
                const Spacer(),
              //   Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text("Don’t Have An Account?"),TextButton(onPressed: ()async{
              //      var result =await Navigator.push<SignData?>(context, MaterialPageRoute(builder: (c)=>const SignInPage() ));
              //      if(result!=null)
              //        {
              //          controllerPhone?.text=result.login;
              //          controllerPassword?.text=result.password;
              //        }
              //     }, child: const Text("SignIn",
              //     style: TextStyle(color: Color(0xffFC4B6F)),
              //     ))
              //   ],
              // )
              ],
            ),
          ),
        ),
      ),
    );
}}
