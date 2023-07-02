
import 'package:flutter/material.dart';

void showProgress(BuildContext context){
  showDialog(context: context, builder: (c){
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  });
}