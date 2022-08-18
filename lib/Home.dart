import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 return Directionality(
  textDirection: TextDirection.rtl,
   child: Scaffold(
 // hellow
    body: Stack(
      textDirection:TextDirection.rtl ,
      children: [
        Positioned(
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height*0.3,
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
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              )
            ),
          ),
        )
      ],
    ),
   ),
 );
  }

}
