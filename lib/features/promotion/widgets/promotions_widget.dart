import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/fakedata/fakedata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fooddeliveryappyoutube/features/promotion/controller/promotion_controller.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/error_text.dart';
import 'package:fooddeliveryappyoutube/utils/widgets/loader.dart';
class PromotionsWidget extends ConsumerWidget {
  const PromotionsWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final promotions=ref.watch(getPromotionsProvider);
    return promotions.when(data: (data){
      return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CarouselSlider(
        items: data.map((i){
          return Builder(
            builder: (BuildContext context){
              return CachedNetworkImage(
                 imageUrl: i.image!,
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
    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader());
  }
}