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
      child: Scaffold(
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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.members[index!]['monthly installments'].length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, i) {
                  print(controller.members[index!]['monthly installments'].length);
                  bool value = true;
                  return Container(
                    color: defautlColor,
                    height: height(context)*0.1,
                    width: width(context)*0.1,
                    child: Column(
                      children: [
                        textA(context, controller.members[index!]['monthly installments'][i]),
                        Checkbox(value: value, onChanged: (val){},checkColor: Colors.white,)
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
