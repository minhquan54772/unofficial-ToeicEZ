import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class DataBaseService {
  final String uid;

  DataBaseService({this.uid});

  final userCollection = FirebaseFirestore.instance.collection("userData");

  Future updateUserInfo(String displayName, String email) async {
    return await userCollection.doc(uid).set({
      'DisplayName': displayName,
      'Email': email
    });
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
  Future getCurrentUserData() async {
    DocumentSnapshot ds = await userCollection.doc(uid).get();
    String displayName = ds.get('DisplayName');
    String email = ds.get('Email');
    return [displayName, email];
  }
}