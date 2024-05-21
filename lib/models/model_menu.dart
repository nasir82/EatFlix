import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:play/models/service_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ModelMenu extends ChangeNotifier{

  final auth = FirebaseAuth.instance;
  final ref = FirebaseFirestore.instance.collection("Adds");
 
 List<ServicesModel> _addList = [];

 ModelMenu() {
  // Listen to changes in the Firestore collection
  ref.snapshots().listen(
    (QuerySnapshot snapshot) {
      _addList = snapshot.docs.map((doc) => ServicesModel(
        name: doc['name'],
        vidioPath: doc['vidioPath'],
        profilePath: doc['profilePath'],
        catagory: doc['catagory'],
        location: doc['location'],
        email: doc['email'],
        phone: doc['phone'],
        facebook: doc['facebook'],
        whatsapp: doc['whatsapp'],
        linkedin: doc['linkedin'],
        uid: doc['uid'],
      )).toList();
      print("no error");
      print(_addList.length.toString());
      // Notify listeners that the list has been updated
      notifyListeners();
    },
    onError: (error) {
      print("Error fetching data: $error");
    },
  );
}

  List<ServicesModel> get  addList => _addList;
}