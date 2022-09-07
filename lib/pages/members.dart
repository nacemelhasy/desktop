import 'package:desktop/compenets/allCompontes.dart';
import 'package:desktop/compenets/defaultCS.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Members extends StatelessWidget{
  @override
  Widget build(Object context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
    
        body:Row(
          children: [
            Container(
              height: height(context),
              width: width(context)*0.5,
              color: defautlColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                   children: [
                    SizedBox(
                      height: height(context)*0.1,
                      width: width(context)*0.5,
                      child: fitted(textA(context, 'الأسماء')),
                      
                    ),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                        data(context,dep: 'حاسوب', name: 'براء سهيل محمد'),
                      ],
                    )
                   ],
                ),
              ),
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height(context)*0.3,
                  width: width(context)*0.5,
                  child: CircleAvatar(
                    backgroundColor: defautlColor,
                    child: SizedBox(
                        height: height(context)*0.3,
                  width: width(context)*0.5,
                  child: fitted( IconButton(onPressed:(){}, icon :const Icon(Icons.person_pin,color: Colors.white,))),
                    ))
                  ),
                SizedBox(
                  height: height(context)*0.1,
                  width: width(context)*0.5,
                  child: fitted(textB(context, "لإضافة عضو أضغط هنا")),
                ),
              
                SizedBox(
                  height: height(context)*0.1,
                  width: width(context)*0.5,
                  child: fitted(  IconButton(onPressed: (){
                  Get.back();
                }, icon:const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ))),
                ),
              
              ],
            )
          ],
        )
      ),
    );
  }

}

Widget data(context,{
  required String name ,
  required String dep,
}) => Padding(
  padding: const EdgeInsets.all(4.0),
  child:   Container(
  
    height: height(context)*0.06,
  
    width: width(context)*0.4,
  
    decoration: BoxDecoration(
  
      color: Colors.white,
  
      borderRadius: BorderRadius.circular(10)
  
  
  
    ),child: Row(
      children: [
        Expanded(flex: 1, child: fitted(textB(context, 'الأسم : $name'))),
        Expanded(flex: 1, child: fitted(textB(context, 'التخصص : $dep'))),
      ],
    ),
  
  ),
);