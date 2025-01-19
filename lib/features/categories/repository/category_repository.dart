

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fooddeliveryappyoutube/features/categories/models/category_model.dart';
import 'package:fooddeliveryappyoutube/providers/firebase_providers.dart';
import 'package:fooddeliveryappyoutube/utils/firebaseconstants.dart';
final categoryRepositoryProvider=Provider((ref)=>CategoryRepository(firebaseFirestore: ref.watch(firebaseFireStoreProvider)));
class CategoryRepository {
  FirebaseFirestore _firebaseFirestore;
  CategoryRepository({required FirebaseFirestore firebaseFirestore}):_firebaseFirestore=firebaseFirestore;
  CollectionReference get _categories=>
  _firebaseFirestore.collection(Firebaseconstants.categoriesCollection);

  Stream<List<CategoryModel>>getCategories(){
    return _categories.snapshots().map((event){
      List<CategoryModel>categories=[];
      for(var doc in event.docs){
        categories.add(CategoryModel.fromJson(doc.data()as Map<String,dynamic>));
      }
      return categories;
    });
  }
}