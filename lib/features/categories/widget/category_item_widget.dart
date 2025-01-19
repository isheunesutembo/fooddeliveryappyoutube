import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryModel category;
   CategoryItemWidget({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center, 
        children: [
           CachedNetworkImage(
           imageUrl: category.image!.toString(),
          fit: BoxFit.fill,
          width: 50,
          height: 50,
         ),
         Text(category.name!,
         style: TextStyle(fontSize: 12,color: Colors.grey[800],fontWeight: FontWeight.w300),),
        ],
        ),
      ),
    );
  }
}