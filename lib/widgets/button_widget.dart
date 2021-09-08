import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;
  const ButtonWidget({ required this.title,required this.hasBorder });

  @override
  Widget build(BuildContext context) {
    final mycolor = Theme.of(context).primaryColor;
    return Material(
      child: Ink(
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: hasBorder? Colors.white: mycolor,
          border: hasBorder? Border.all(
            color: mycolor,
            width: 1.5,
          ): Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60.0,
            child: Center(
              child: Text(title,style: TextStyle(
                color: hasBorder? mycolor:Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}