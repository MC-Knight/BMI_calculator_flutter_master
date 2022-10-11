import 'package:flutter/material.dart';

const knbackgroundColor = Color(0xFF263238);
const knblueGreyColor = Color(0xFF37474F);
const kntranparentColor = Color(0xFFECEFF1);

//card to be inherted
class PageCard extends StatelessWidget {
  const PageCard(
      {super.key,
      this.width = 130,
      required this.borderSide,
      this.height = 150,
      required this.child});

  final BorderSide? borderSide;
  final double width;
  final double height;
  final Column child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: borderSide ?? BorderSide.none),
        color: knblueGreyColor,
        child: child,
      ),
    );
  }
}
