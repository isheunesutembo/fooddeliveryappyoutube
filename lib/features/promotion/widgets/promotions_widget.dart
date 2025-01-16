import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fooddeliveryappyoutube/fakedata/fakedata.dart';
import 'package:cached_network_image/cached_network_image.dart';
class PromotionsWidget extends StatelessWidget {
  const PromotionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CarouselSlider(
        items: FakeData.promotions.map((i){
          return Builder(
            builder: (BuildContext context){
              return Image.asset(
                 i,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          );
          
        }).toList(),
        options: CarouselOptions(height: 200,autoPlay: true,viewportFraction: 1),
      ),
    );
  }
}