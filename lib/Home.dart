import 'package:desktop/compenets/allCompontes.dart';
import 'package:desktop/compenets/defaultCS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
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
        textDirection:TextDirection.rtl ,
        children: [
           
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height*0.4,
            decoration:  BoxDecoration(
              color:const Color.fromARGB(255, 255, 8, 8),
          border: Border.all(
          color: Colors.white,
          width: 4
          ),
          boxShadow:const [
           BoxShadow(
            color: Color.fromARGB(85, 0, 0, 0),
            blurRadius: 4,
            offset: Offset(-6, 4)
            
          )
          ],
              borderRadius:const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )
            ),
          ),
          SizedBox(
            width: width(context)*0.15,
          ),
    Column(
      children: [

          Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                      height: height(context)*0.1,
                      width: width(context)*0.5,
                      child: 
                    fitted( text(context, 'منظومة الباش مهندسين')),
                    ),
              ),
                  Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                      height: height(context)*0.1,
                      width: width(context)*0.5,
                      child: 
                    fitted( text(context, 'Engineers system')),
                    ),
              ),
      ],
    )

     
        ],
      ),
    ),
   ),
 );
  }

}