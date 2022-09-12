import 'package:desktop/compenets/GetState.dart';
import 'package:desktop/compenets/allCompontes.dart';
import 'package:desktop/compenets/defaultCS.dart';
import 'package:desktop/compenets/sqflite.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Installments extends GetView<Database> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Stack(
        children: [
          // shape rectange red
          Positioned(
            right: 0,
            child: Container(
              height: height(context),
              width: width(context) * 0.15,
              color: defautlColor,
            ),
          ),

          ListView.separated(
              separatorBuilder: ((context, index) =>
                const   Divider(color:Colors.white)),
              itemCount: controller.members.length,
              itemBuilder: (context, i) {
                bool value = true;
                return SizedBox(
                  height: height(context) * 0.1,
                  child: Row(
                    children: [
                      SizedBox(
                          height: height(context) * 0.04,
                          width: width(context) * 0.15,
                          child: 
                          fitted(
                              textA(context, controller.members[i]['name']))),
                      SizedBox(
                        height: height(context) * 0.1,
                        width: width(context) * 0.8,
                        child: ListView.separated(
                          separatorBuilder: (context,_)=>SizedBox(width: width(context)*0.005,),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                            
                                height: height(context) * 0.1,
                                width: width(context) * 0.05,
                                child:    fitted(Checkbox(
                                      value: value,
                                      checkColor:Colors.white,
                                      activeColor: defautlColor,
                                      onChanged: (value) {},
                                    )),)
                          )),
                          itemCount: controller.monthly_installments.length,
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      )),
    );
  }
}
