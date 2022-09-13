import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:desktop/compenets/GetState.dart';
import 'package:desktop/main.dart';
import 'package:desktop/pages/table_dinner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../compenets/allCompontes.dart';
import '../compenets/defaultCS.dart';

class Shuflle extends GetView<Database> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Database>(
        builder: (_) => Scaffold(
              backgroundColor: defautlColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // title and back icon
                    SizedBox(
                        height: height(context) * 0.1,
                        width: width(context),
                        child: Row(children: [
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
                                  ))))
                        ])),

                    // body
                    controller.shuffled
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
                            height: height(context) * 0.6,
                            width: width(context),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height(context) * 0.2,
                                  width: width(context),
                                  child: fitted(IconButton(
                                      onPressed: () {
                                        // dialog
                                        awesome(context,
                                            dialogType: DialogType.NO_HEADER,
                                            dialogBackgroundColor: Colors.white,
                                            body: SizedBox(
                                              height: height(context) * 0.2,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        height(context) * 0.1,
                                                    width: width(context),
                                                    child: fitted(textB(context,
                                                        'الرجاء الأنتظار قليلا')),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        height(context) * 0.1,
                                                    width: width(context),
                                                    child: fitted(indicator()),
                                                  ),
                                                ],
                                              ),
                                            ));
                                        // start shuffled
                                        Future.delayed(
                                          const Duration(
                                            seconds: 10,
                                          ),
                                          () {
                                            controller.prepareTable();
                                            Get.back();
                                            controller.update();
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.done))),
                                ),
                                SizedBox(
                                    height: height(context) * 0.2,
                                    width: width(context),
                                    child:
                                        fitted(textA(context, 'بدأ القرعة'))),
                              ],
                            )),
                          )
                  ],
                ),
              ),
            ));
  }
}
