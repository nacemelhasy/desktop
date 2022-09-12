import 'dart:convert';

import 'package:desktop/main.dart';
import 'package:desktop/pages/members.dart';
import 'package:get/get.dart';

class Database extends GetxController {
  List members = [];
  List tableDinner = [];
  // ignore: non_constant_identifier_names
  List monthly_installments = [];
  String decDate = '';
  bool random = false;
  @override
  void onInit() {
    
    if (pref.containsKey('members')) {
      members = jsonDecode(pref.getString('members').toString());
    }
    if (pref.containsKey('tableDinner')) {
      tableDinner = jsonDecode(pref.getString('tableDinner').toString());
      random = true;
    }
    members.forEach((e) {
      
      monthly_installments.add({'${e['date']}': false});
    });
    
    super.onInit();
  }

  void addMember(Map m) {
    members.add(m);
    decDate = jsonEncode(members);
    print(decDate);
    pref.setString('members', decDate);
    update();
  }

  void deleteMember(name) {
    for (int i = 0; i < members.length; i++) {
      if (members[i]['name'] == name) {
        // ignore: list_remove_unrelated_type
        members.removeAt(i);
        decDate = jsonEncode(members);
        pref.setString('members', decDate);
        update();
      }
    }
  }

  // randomation
  void prepareTable() {
    members.shuffle(); // random
    int month = 11;
    int year = 2022;
    for (int i = 0; i < members.length; i++) {
      tableDinner.add({
        'name': members[i]['name'],
        'month': month,
        'date': '$year/$month/15'
      });
      if (month == 12) {
        year++;
        month = 1;
      } else {
        month++;
      }
    }

    String decTableDinner = jsonEncode(tableDinner);
    pref.setString('tableDinner', decTableDinner);
    random = true;
  }
}
