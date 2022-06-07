import 'package:flutter/material.dart';

class CircleProgressBox extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final double borderWidth;
  final double boxHeight, boxWidth;

  CircleProgressBox(
      {Key? key,
        required this.boxHeight,
        required this.boxWidth,
        required this.borderColor,
        required this.borderWidth,
        required this.child,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: boxWidth,
            height: boxHeight,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300]
            ),
          ),
          Container(
              color: Colors.transparent,
              child: Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: boxWidth * (borderWidth/10),
                    height: boxHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: borderColor

                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: boxWidth,
                    height: boxHeight * (borderWidth/10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: borderColor
                    ),
                  ),
                )
              ])),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Container(
              width: boxWidth,
              height: boxHeight,
              decoration: BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Center(child: child),
            ),
          )
        ],
      ),
    );
  }
}