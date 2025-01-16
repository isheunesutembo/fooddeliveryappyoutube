import 'package:flutter/material.dart';
import 'package:fooddeliveryappyoutube/fakedata/fakedata.dart';
import 'package:fooddeliveryappyoutube/features/categories/widget/category_item_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: FakeData.categoriesList.length,
      shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: (context,index){
        return CategoryItemWidget(category: FakeData.categoriesList[index]);
      });
  }
}