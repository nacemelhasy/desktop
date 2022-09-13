import 'package:desktop/compenets/GetState.dart';
import 'package:desktop/compenets/allCompontes.dart';
import 'package:desktop/compenets/defaultCS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Profile extends GetView<Database> {
  int? index;
  // ignore: use_key_in_widget_constructors
  Profile({this.index});
  @override
  Widget build(Object context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: GetBuilder<Database>(
          builder: (_) => Scaffold(
            body: Column(
              children: [
                Container(
                  color: defautlColor,
                  height: height(context) * 0.1,
                  width: width(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: fitted(IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back))),
                      ),
                      Expanded(
                        child: fitted(textA(context,
                            'الأسم : ${controller.members[index!]['name']}')),
                      ),
                      Expanded(
                        child: fitted(textA(context,
                            'التخصص : ${controller.members[index!]['department']}')),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.1,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller
                        .members[index!]['monthly_installments'].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio:
                            (width(context) / height(context)) / 0.5,
                        crossAxisCount: 3,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0),
                    itemBuilder: (context, i) {
                      return Container(
                        color: defautlColor,
                        height: height(context) * 0.1,
                        width: width(context) * 0.1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: fitted(textA(
                                  context,
                                  controller
                                      .members[index!]['monthly_installments']
                                          [i]
                                      .keys
                                      .toList()[0])),
                            ),
                            Expanded(
                                flex: 2,
                                child: fitted(Checkbox(
                                  value: controller.members[index!]
                                          ['monthly_installments'][i][
                                      '${controller.members[index!]['monthly_installments'][i].keys.toList()[0]}'],
                                  fillColor:
                                      MaterialStateProperty.all(Colors.white),
                                  onChanged: (val) {
                                    print(controller.members[index!]);
                                    var t = controller
                                        .members[index!]; // main map of member
                                    t['monthly_installments'][i][
                                        '${t['monthly_installments'][i].keys.toList()[0]}'] = !t[
                                            'monthly_installments'][i][
                                        '${t['monthly_installments'][i].keys.toList()[0]}'];

                                    print('===================================================');
                                    print(controller.members);

                                    controller.ckecked();

                                    controller.update();
                                  },
                                  checkColor: defautlColor,
                                )))
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
