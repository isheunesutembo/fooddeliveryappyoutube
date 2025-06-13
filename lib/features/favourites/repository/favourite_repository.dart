

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/menu/models/menu_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
final favouriteRepositoryProvider=Provider<FavouriteRepository>((ref){
  final box=Hive.box("menufavourites");
  return FavouriteRepository(box);
});
class FavouriteRepository {

  final Box<dynamic>menuItemBox;

  FavouriteRepository(this.menuItemBox);

  Future<void>addMenuItem(MenuModel menu)async{
     await menuItemBox.add(menu.toJson());
  }

  Future<void>deleteMenuItem(int index)async{
    await menuItemBox.deleteAt(index);
  }

  List<MenuModel>getMenuItems(){
    return menuItemBox.values.map((item)=>MenuModel.fromJson(item)).toList();
  }
}

