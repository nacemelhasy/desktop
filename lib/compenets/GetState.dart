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
  bool shuffled = false;
  @override
  void onInit() {
    if (pref.containsKey('members')) {
      members = jsonDecode(pref.getString('members').toString());
    }

    if (pref.containsKey('tableDinner')) {
      tableDinner = jsonDecode(pref.getString('tableDinner').toString());
      shuffled = true;
    }
    if (pref.containsKey('monthly_installments')) {
      monthly_installments =
          jsonDecode(pref.getString('monthly_installments').toString());
    }
    super.onInit();
  }

  void addMember(Map m) {
    if (!shuffled) {
      members.add(m);
      decDate = jsonEncode(members);
      pref.setString('members', decDate);
    } else {
      ///////////////// first step update table dinner
      int year = int.parse(
          tableDinner[tableDinner.length - 1]['date'].toString().split('/')[0]);
      int month = tableDinner[tableDinner.length - 1]['month'];
      if (month == 12) {
        year++;
        month = 1;
      } else {
        month++;
      }
      tableDinner
          .add({'name': m['name'], 'month': month, 'date': '$year/$month/15'});

////////// second step update monthly installment
      monthly_installments.add({
        // for calender
        '$year/$month': false
      });

      // for add a new montly insatllment for all members
      for ( int i =0 ;i<members.length ;i++) {
        members[i]['monthly_installments'].add({
          // for calender
          '$year/$month': false
        });

      }

      m.addEntries({
        MapEntry('monthly_installments', monthly_installments)
      }); // for add montly installment for new memner
      members.add(m);
      decDate = jsonEncode(members);
      pref.setString('members', decDate);

        String decTableDinner =
        jsonEncode(tableDinner); // encode data for save in local database
    String decMonthly_installments = jsonEncode(
        monthly_installments); // encode data for save in local database
    pref.setString('tableDinner', decTableDinner);
    pref.setString('monthly_installments', decMonthly_installments);
       update();
    }
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

  // shuffled
  void prepareTable() {
    members.shuffle(); // shuffled
    int month = 11;
    int year = 2022;
    for (int i = 0; i < members.length; i++) {
      tableDinner.add({
        'name': members[i]['name'],
        'month': month,
        'date': '$year/$month/15'
      });
      monthly_installments.add({
        // for calender
        '$year/$month': false
      });

      if (month == 12) {
        year++;
        month = 1;
      } else {
        month++;
      }
    }

    String decTableDinner =
        jsonEncode(tableDinner); // encode data for save in local database
    String decMonthly_installments = jsonEncode(
        monthly_installments); // encode data for save in local database
    pref.setString('tableDinner', decTableDinner);
    pref.setString('monthly_installments', decMonthly_installments);

    // for update monthly installments for all members in engineering system

    for (Map t in members) {
      t.addEntries({MapEntry('monthly_installments', monthly_installments)});
    }
    decDate = jsonEncode(members);
    pref.setString('members', decDate);
    shuffled = true; // for knowing is it shuffled make or not
  }

  // for check value
  void ckecked() {
    decDate = jsonEncode(members);
    pref.setString('members', decDate);
  }
}
