import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:play/models/service_models.dart';
import 'package:play/models/user_model.dart';

Future<bool> upLoadReourses(ServicesModel model) async {
  try {
    // Get a reference to the Firestore collection
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("Adds");

    // Convert the ServicesModel object to a Map as flutter firebase is not accepting like kotlin
    Map<String, dynamic> data = {
      'name': model.name,
      'vidioPath': model.vidioPath,
      'profilePath': model.profilePath,
      'location': model.location,
      'email': model.email,
      'phone': model.phone,
      'catagory': model.catagory,
      'facebook': model.facebook,
      'whatsapp': model.whatsapp,
      'linkedin': model.linkedin,
      'uid': model.uid,
    };

    // Add the document to the collection
    await collectionRef.add(data);

    return true;
  } catch (e) {
    rethrow;
  }
}

uploadB() {
  final ref = FirebaseFirestore.instance.collection("userInfom");

  Map<String, dynamic> data = {
    'name': "your naem",
    'vidioPath': "your path",
    'profilePath': "tornanir heda"
  };
  ref.add(data);
}

//User information maintain
Future<bool> updateUserInformation(UserModel user, String uid) async {


  try {
    final ref = FirebaseFirestore.instance.collection("users").doc(uid);

    Map<String, dynamic> data = {
      'name': user.name,
      'profilePath': user.profilePath,
      'location': user.location,
      'email': user.email,
      'phone': user.phone,
      'catagory': user.catagory,
      'facebook': user.facebook,
      'whatsapp': user.whatsapp,
      'linkedin': user.linkedin,
      'uid': uid,
    };

    await ref.set(data);
    return true;
  
  } catch (e) {
   rethrow;
  }
 
}

// User information get

void fetchUserInformation() {}

// MyData fetch
void getMyData() {}

/** 
ServicesModel(
                                    name: document['name'],
                                    vidioPath: document['vidioPath'],
                                    profilePath: document['profilePath'],
                                    catagory: document['catagory'],
                                    location: document['location'],
                                    email: document['email'],
                                    phone: document['phone'],
                                    facebook: document['facebook'],
                                    whatsapp: document['whatsapp'],
                                    linkedin: document['linkedin'],
                                    uid: document['uid'])
*/