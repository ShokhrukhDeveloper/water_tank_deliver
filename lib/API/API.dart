import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:water_tank_deliver/Pages/Widgets/progress.dart';


import '../Data/Model/Company.dart';
import '../Data/Model/Order.dart';
import '../Data/Model/OrdersPagenated.dart';
import '../Data/Model/Token.dart';
import '../Data/Model/User.dart';
import '../Data/Storage/LocalStorage.dart';
import '../Data/Urls/Urls.dart';
class API
{
  static Future getHomeData({ int limit=10,int page=1})async
  {
    try{
      var result = await http.get(Uri.parse(AppUrls.orderCompany(limit: limit,page: page)), headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*',"Authorization":"Bearer ${LocalStorage.getToken()}" },);
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
          return OrdersPagenated.fromJson(r);
        }
      else{
        return result.body;
      }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
  static Future getAcceptedOrder({ int limit=10,int page=1})async
  {
    try{
      var result = await http.get(Uri.parse(AppUrls.orderAccepted(limit: limit,page: page)), headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*',"Authorization":"Bearer ${LocalStorage.getToken()}" },);
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
          return OrdersPagenated.fromJson(r);
        }
      else{
        return result.body;
      }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
  static Future acceptOrder({required int orderId})async
  {
    try{
      if (kDebugMode) {
      print(AppUrls.orderAccept(orderId: orderId));
    }
      var result = await http.get(Uri.parse(AppUrls.orderAccept(orderId: orderId)),
        headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*',"Authorization":"Bearer ${LocalStorage.getToken()}" },
      );
      if (kDebugMode) {

        print(result.statusCode);
        print(result.body);
      }

      if(result.statusCode==200)
      {

        var r = jsonDecode(result.body);
        if (kDebugMode) {
          print(r);
        }
        return  Order.fromJson(r);
      }
    }catch(e)
    {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future completeOrder({required int orderId,required int tankCount})async
  {
    try{
      if (kDebugMode) {
      print(AppUrls.completeAcceptedOrder(orderId: orderId, tankCount: tankCount));
    }

      var result = await http.get(Uri.parse(AppUrls.completeAcceptedOrder(orderId: orderId, tankCount: tankCount)),
        headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*',"Authorization":"Bearer ${LocalStorage.getToken()}" },
      );
      if (kDebugMode) {
        print(result.statusCode);
        print(result.body);
      }
      if(result.statusCode==200)
      {
        var r = jsonDecode(result.body);
        if (kDebugMode) {
          print(r);
        }
        return  Order.fromJson(r);
      }
      return result.body;
    }catch(e)
    {
      if (kDebugMode) {
        print(e);
      }
    }
  }












  static Future getCompanyData()async
  {
    try{
      var result = await http.get(Uri.parse(AppUrls.company));
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
              return  Company.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }

  static Future getCreatedOrder({ int limit=10,int page=1})async
  {
    try{
      var result = await http.get(Uri.parse(AppUrls.orderCompleted(limit: limit,page: page)),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*' ,"Authorization":"Bearer ${LocalStorage.getToken()}"},
      );

      print(result.statusCode);
      print(result.body);
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
              return  OrdersPagenated.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
  static Future getDeliveringOrder({ int limit=10,int page=1})async
  {
    try{
      var result = await http.get(Uri.parse(AppUrls.orderDelivering(limit: limit,page: page)),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*',"Authorization":"Bearer ${LocalStorage.getToken()}" },
      );

      print(result.statusCode);
      print(result.body);
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
              return  OrdersPagenated.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
  static Future getCompletedOrder({int limit=10,int page=1})async
  {
    try{
      print(LocalStorage.getToken());
      var result = await http.get(Uri.parse(AppUrls.orderCompleted(limit: limit,page: page)),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*',"Authorization":"Bearer ${LocalStorage.getToken()}" },
      );

      print(result.statusCode);
      print(result.body);
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
          return  OrdersPagenated.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
  static Future loginDeliver({required String phone,required String password})async
  {
    try{
      if (kDebugMode) {
        print(AppUrls.login);
      }
      var result = await http.post(Uri.parse(AppUrls.login),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*' },
        body: jsonEncode(
            {
              "phone" : phone,
              "password" : password
            }));

      print(result.statusCode);
      print(result.body);
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
          return  Token.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
  static Future signUp({required String phone,required String address,required String name,required String password})async
  {
    try{
      print(AppUrls.signUp);
      var result = await http.post(Uri.parse(AppUrls.signUp),
          headers: {'Content-Type': 'application/json; charset=UTF-8', 'accept':'*/*' },
        body: jsonEncode(
            {
              "name": name,
              "address": address,
              "phone": phone,
              "password": password
            }));

      print(result.statusCode);
      print(result.body);
      if(result.statusCode==200)
        {
          var r = jsonDecode(result.body);
          return  User.fromJson(r);
        }
    }catch(e)
    {
    if (kDebugMode) {
      print(e);
    }
    }
  }
}