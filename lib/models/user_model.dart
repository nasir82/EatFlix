import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
   String? name;
   String? profilePath;
   String? location;
   String? email;
   String? phone;
   String? catagory;
   String? facebook;
   String? whatsapp;
   String? linkedin;
   String? uid;

   UserModel({
     this.name,
     this.profilePath,
     this.catagory,
     this.location,
     this.email,
     this.phone,
     this.facebook,
     this.whatsapp,
     this.linkedin,
     this.uid
    });

    factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      name: data['name'],
    profilePath: data['profilePath'], 
    catagory: data['category'], 
    location: data['location'],
    email: data['email'],
    phone: data['phone'],
    facebook: data['facebook'],
    whatsapp: data['whatsapp'],
    linkedin: data['linkedin'],
    uid: snapshot.id,
    );
  }
}