import 'package:desktop/compenets/GetState.dart';
import 'package:desktop/compenets/allCompontes.dart';
import 'package:desktop/compenets/defaultCS.dart';
import 'package:desktop/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Table_dinner extends GetView<Database> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: defautlColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(
                height: height(context) * 0.1,
                width: width(context),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 1,
                      child: fitted(textA(context, 'جدول العشوات')),
                    ),
                    Expanded(
                        flex: 1,
                        child: fitted(IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                            )))),
                  ],
                )),
            pref.containsKey('tableDinner')
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.tableDinner.length,
                    itemBuilder: ((context, i) => data(context,
                        date: controller.tableDinner[i]['date'],
                        month: controller.tableDinner[i]['month'],
                        name: controller.tableDinner[i]['name'])),
                  )
                : SizedBox(
                    height: height(context) * 0.9,
                    width: width(context),
                    child: Center(
                      child: SizedBox(
                        height: height(context) * 0.1,
                        width: width(context) * 0.5,
                        child:
                            fitted(textA(context, 'لم تطبق القرعة الى الأن')),
                      ),
                    ),
                  )
          ]),
        ));
  }
}

// for deatails table
Widget data(
  context, {
  required String date,
  required int month,
  required String name,
}) =>
    Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: height(context) * 0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: fitted(textB(context, 'تاريخ العشاء : $date',
                    textAlign: TextAlign.center)),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: fitted(textB(context, 'صاحب العشاء  :$name',
                    textAlign: TextAlign.center)),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: fitted(textB(context, 'عشاء شهر : $month',
                    textAlign: TextAlign.center)),
              )),
        ]),
      ),
    );
