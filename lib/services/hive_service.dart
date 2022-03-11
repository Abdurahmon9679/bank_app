import 'dart:convert';

import 'package:bank_app/models/card_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DBService{
  static const String dbName="db_notes";
  static Box box = Hive.box(dbName);



  static Future<void>storeMode(bool isLight)async{
    await box.put("isLight",isLight);
  }
  static bool loadMode(){
    return box.get("isLight",defaultValue: true);
  }

  static Future<void>storeCart(List<CardModel>cards)async{
    ///object=>map=>Stirng
    List<String>stringList = cards.map((card) => jsonEncode(card.toJson())).toList();
    await box.put("notes", stringList);
  }

  static List<CardModel>loadCart(){
    ///String =>Map=>objcet
    List<String>stringList=box.get("notes")??<String>[];
    List<CardModel>cards = stringList.map((string) => CardModel.fromJson(jsonDecode(string))).toList();
    return cards;
  }

  static Future<void>removeCart()async{
    await box.delete("notes");
  }

}