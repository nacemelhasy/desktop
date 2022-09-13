import 'package:desktop/compenets/GetState.dart';
import 'package:desktop/compenets/allCompontes.dart';
import 'package:desktop/compenets/defaultCS.dart';
import 'package:desktop/pages/members.dart';
import 'package:desktop/pages/shuffle.dart';
import 'package:desktop/pages/table_dinner.dart';
import 'package:desktop/pages/installment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<Database> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: height(context),
          width: width(context),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.22,
                decoration: BoxDecoration(
                  color: defautlColor,
                  // border: Border.all(color: Colors.white, width: 4),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(85, 0, 0, 0),
                        blurRadius: 4,
                        offset: Offset(-6, 4))
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height(context) * 0.05,
                    ),
                    SizedBox(
                      height: height(context) * 0.1,
                      width: width(context) * 0.2,
                      child: fitted(textA(context, 'Engineers system')),
                    ),
                    SizedBox(
                      height: height(context) * 0.1,
                    ),
                    // one rectangle
                    InkWell(
                        onTap: () {
                          Get.to(() => Table_dinner());
                        },
                        child: rectangle(context,
                            title: 'جدول العشوات',
                            shape: const Icon(
                              Icons.calendar_month,
                              color: Colors.black,
                            ))),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    // two rectangle
                    InkWell(
                        onTap: () {
                          Get.to(() => Members());
                        },
                        child: rectangle(context,
                            title: 'أعضاء الجمعية',
                            shape: const Icon(
                              Icons.people,
                              color: Colors.black,
                            ))),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    // three rectangle
                    InkWell(
                        onTap: () {
                          Get.to(() => Shuflle());
                        },
                        child: rectangle(context,
                            title: 'قرعة العشوات',
                            shape: const Icon(
                              Icons.table_chart,
                              color: Colors.black,
                            ))),
                    SizedBox(
                      height: height(context) * 0.03,
                    ),
                    // four rectangle
                    InkWell(
                        onTap: () {
                          Get.to(() => Installments());
                        },
                        child: rectangle(context,
                            title: 'جدول الأقساط',
                            shape: const Icon(
                              Icons.request_quote_rounded,
                              color: Colors.black,
                            ))),

                    const Spacer(),
                    SizedBox(
                      height: height(context) * 0.1,
                      width: width(context) * 0.2,
                      child: fitted(textA(context, 'منظومة الباش مهندسين')),
                    ),
                  ],
                ),
              ),
              // amount of space
              SizedBox(
                width: width(context) * 0.15,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: height(context) * 0.1,
                      width: width(context) * 0.5,
                      child: fitted(text(context, 'منظومة الباش مهندسين')),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: height(context) * 0.1,
                      width: width(context) * 0.5,
                      child: fitted(text(context, 'Engineers system')),
                    ),
                  ),

//amount of space
                  SizedBox(
                    height: height(context) * 0.08,
                  ),

// for four square
                  SizedBox(
                      height: height(context) * 0.7,
                      width: width(context) * 0.4,
                      child: GetBuilder<Database>(
                        builder: (_) => GridView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.17,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 10),
                          children: [
                            // one square
                            square(context,
                                title: 'عدد الأعضاء',
                                subTitle: controller.members.length.toString(),
                                shape: const Icon(Icons.engineering)),
                            // two square
                            square(context,
                                title: 'إجمالي القيمة المالية',
                                subTitle: '1250 دل',
                                shape: const Icon(Icons.attach_money_sharp)),

                            // three square
                            square(context,
                                title: 'عدد الاستراحات',
                                subTitle: '3',
                                shape: const Icon(Icons.home)),

                            // four square
                            square(context,
                                title: 'المبلغ الناقص',
                                subTitle: '70 دل',
                                shape: const Icon(Icons.money_off_rounded))
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// for sqaure shape

Widget square(context,
    {required String title, required String subTitle, required Icon shape}) {
  return Container(
    height: height(context) * 0.02,
    width: width(context) * 0.02,
    decoration: BoxDecoration(
        color: defautlColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(blurRadius: 4, offset: Offset(0, 2))]),
    child: Column(
      children: [
        Expanded(
          flex: 1,
          child: fitted(textA(context, title)),
        ),
        Expanded(
          flex: 3,
          child: fitted(shape),
        ),
        Expanded(
            flex: 1,
            child: fitted(
              textA(context, subTitle),
            )),
      ],
    ),
  );
}

// for rectange in aside
Widget rectangle(context, {required String title, required Icon shape}) =>
    Container(
      height: height(context) * 0.09,
      width: width(context) * 0.21,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: fitted(Padding(
              padding: const EdgeInsets.all(2.0),
              child: textB(context, title),
            )),
          ),
          Expanded(
            flex: 1,
            child: fitted(
                Padding(padding: const EdgeInsets.all(3.0), child: shape)),
          )
        ],
      ),
    );
