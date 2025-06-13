import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/menu/models/menu_model.dart';
import 'package:fooddeliveryappyoutube/providers/firebase_providers.dart';
import 'package:fooddeliveryappyoutube/utils/firebaseconstants.dart';
final menuRepositoryProvider=Provider((ref)=>MenuRepository(firebaseFirestore: ref.watch(firebaseFireStoreProvider)));
class MenuRepository {
  FirebaseFirestore _firebaseFirestore;
  MenuRepository({required FirebaseFirestore firebaseFirestore}):_firebaseFirestore=firebaseFirestore;
  CollectionReference get _menus=>
  _firebaseFirestore.collection(Firebaseconstants.menuCollection);

  Stream<List<MenuModel>>getMenus(){
    return _menus.limit(10).snapshots().map((event){
      List<MenuModel>menus=[];
      for(var doc in event.docs){
        menus.add(MenuModel.fromJson(doc.data()as Map<String,dynamic>));
      }
      return menus;
    });
  }

  Stream<List<MenuModel>>getMenuById(String categoryId){

    return _menus.where("categoryId",isEqualTo: categoryId)
    .snapshots().map((event){
      List<MenuModel>menus=[];
      for (var doc in event.docs){
        menus.add(MenuModel.fromJson(doc.data()as Map<String,dynamic>));
      }
      return menus;
    });

  }



}