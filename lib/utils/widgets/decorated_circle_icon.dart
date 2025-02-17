import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  Image image;
   CircleIcon({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return   Container(
                  height: 43,
                  width: 43,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle,
                      ),
                      child: image,
                );
  }
}