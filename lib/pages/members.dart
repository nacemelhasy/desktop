import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:desktop/compenets/GetState.dart';
import 'package:desktop/compenets/allCompontes.dart';
import 'package:desktop/compenets/defaultCS.dart';
import 'package:desktop/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GlobalKey<FormState> key = GlobalKey<FormState>();

class Members extends GetView<Database> {
  late String name, department; // for add new member
  @override
  Widget build(Object context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Builder(builder: (context) {
        return Scaffold(
            body: Row(
          children: [
            Container(
              height: height(context),
              width: width(context) * 0.5,
              color: defautlColor,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: GetBuilder<Database>(
                    builder: (_) => Column(
                      children: [
                        SizedBox(
                          height: height(context) * 0.1,
                          width: width(context) * 0.5,
                          child: fitted(textA(context, 'الأسماء')),
                        ),
                        controller.members.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.members.length,
                                itemBuilder: (BuildContext context, int i) {
                                  if (controller.members.isNotEmpty) {
                                    return InkWell(
                                      onTap: (){
                                    if(controller.shuffled){
                                        Get.to(()=>Profile(
                                          index: i,
                                        ));}else{
                                               awesome(context,
                                            dialogType: DialogType.ERROR,
                                            dialogBackgroundColor: Colors.white,
                                            body: SizedBox(
                                              height: height(context) * 0.1,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        height(context) * 0.1,
                                                    width: width(context),
                                                    child: fitted(textB(context,
                                                        'الرجاء قم بالقرعة أولا')),
                                                  ),
                                                
                                                ],
                                              ),
                                            ));
                                        }
                                      },
                                      child: Dismissible(
                                          key: UniqueKey(),
                                          onDismissed: (_) {
                                            controller.deleteMember(
                                                controller.members[i]['name']);
                                          },
                                          child: data(context,
                                              name: controller.members[i]['name'],
                                              dep: controller.members[i]
                                                  ['department'])),
                                    );
                                  }

                                  return indicator();
                                })
                            : SizedBox(
                                height: height(context) * 0.9,
                                width: width(context) * 0.5,
                                child: Center(
                                  child: SizedBox(
                                    height: height(context) * 0.1,
                                    width: width(context) * 0.5,
                                    child: fitted(textA(
                                        context, 'لا يوجد أي عضو الي الأن')),
                                  ),
                                ),
                              )
                      ],
                    ),
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: height(context) * 0.3,
                    width: width(context) * 0.5,
                    child: CircleAvatar(
                        backgroundColor: defautlColor,
                        child: SizedBox(
                          height: height(context) * 0.3,
                          width: width(context) * 0.5,
                          child: fitted(IconButton(
                              onPressed: () {
                                awesome(context,
                                    btnCancelColor: Colors.white,
                                    btnOkColor: Colors.white,
                                    dialogBackgroundColor: defautlColor,
                                    dialogType: DialogType.NO_HEADER,
                                    body: Container(
                                      color: defautlColor,
                                      height: height(context) * 0.3,
                                      width: width(context),
                                      child: Directionality(
                                          textDirection: TextDirection.rtl,

                                          // form for  member data
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                height: height(context) * 0.2,
                                                child: Form(
                                                  key: key,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: cFormFiled(
                                                            context,
                                                            labelText: 'الأسم',
                                                            save: (val) {
                                                          name = val.toString();
                                                        }, validator: (val) {
                                                          if (val
                                                                  .toString()
                                                                  .length <
                                                              5) {
                                                            return 'لا يمكن أن يكون الأسم أقل من خمس حروف';
                                                          }
                                                          return null;
                                                        }),
                                                      ),
                                                      Expanded(
                                                          flex: 1,
                                                          child: cFormFiled(
                                                              context,
                                                              save: (val) {
                                                            department =
                                                                val.toString();
                                                          }, validator: (val) {
                                                            if (val
                                                                    .toString()
                                                                    .length <
                                                                3) {
                                                              return 'لا يمكن أن يكون التخصص أقل من ثلاث حروف';
                                                            }
                                                            return null;
                                                          },
                                                              labelText:
                                                                  'التخصص')),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: height(context) * 0.1,
                                                width: width(context),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: fitted(IconButton(
                                                          onPressed: () {
                                                            if (key
                                                                .currentState!
                                                                .validate()) {
                                                               
                                                                     
                                                              key.currentState!
                                                                  .save();
                                                              Map temp = {
                                                                'name': name,
                                                                'department':
                                                                    department,
                                                                  
                                                              };
                                                              controller
                                                                  .addMember(
                                                                      temp);
                                                              Get.back();
                                                          
                                                            }
                                                          },
                                                          icon: const Icon(
                                                            Icons.done,
                                                            color: Colors.white,
                                                          ))),
                                                    ),
                                                    Expanded(
                                                        flex: 1,
                                                        child: fitted(
                                                            IconButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                icon: const Icon(
                                                                    Icons
                                                                        .cancel)))),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    ));
                              },
                              icon: const Icon(
                                Icons.person_pin,
                                color: Colors.white,
                              ))),
                        ))),
                SizedBox(
                  height: height(context) * 0.1,
                  width: width(context) * 0.5,
                  child: fitted(textB(context, "لإضافة عضو أضغط على الأيقونة")),
                ),
                SizedBox(
                  height: height(context) * 0.1,
                  width: width(context) * 0.5,
                  child: fitted(IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ))),
                ),
              ],
            )
          ],
        ));
      }),
    );
  }
}

Widget data(
  context, {
  required String name,
  required String dep,
}) =>
    Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: height(context) * 0.06,
        width: width(context) * 0.4,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(flex: 1, child: fitted(textB(context, 'الأسم : $name'))),
            Expanded(flex: 1, child: fitted(textB(context, 'التخصص : $dep'))),
          ],
        ),
      ),
    );
