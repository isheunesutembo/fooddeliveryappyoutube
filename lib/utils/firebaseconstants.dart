import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firebaseconstants {
  static const usersCollection="users";
  static const categoriesCollection="categories";
  static const promotionsCollection="promotions";
   static const menuCollection="menu";
  static  final user=FirebaseAuth.instance.currentUser;
   static final cartRef=FirebaseFirestore.instance.collection("users").doc(user!.uid.toString());
}