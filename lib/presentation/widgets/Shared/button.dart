

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonCustom extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final double height;
  final IconData? icon;
  VoidCallback onPressed;

   ButtonCustom({
    super.key,
     required this.text,
      required this.color,
       required this.width, 
       required this.height, 
        this.icon,
        required this.onPressed,
        
        });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: size.width*width,
          height: height,
          decoration: BoxDecoration(
            color:color,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(color: color,
              blurRadius: 10,
              offset: const Offset(0, 4)
              ),
              
            ]
          ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon!=null)
            Icon(icon, color: Colors.white,),
            const SizedBox(width: 10,),
            Text(text, style: const TextStyle(color: Colors.white, fontSize: 15),),
          ],
        ),
        ),
      ),
    );
  }
}