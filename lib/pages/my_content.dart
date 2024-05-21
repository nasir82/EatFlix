
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:play/components/my_videos.dart';
import 'package:play/models/service_models.dart';
import 'package:play/pages/upload_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyContent extends StatefulWidget {
  const MyContent({super.key});

  @override
  State<MyContent> createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("MyContents"),),

        body: Column(
          children: [

        StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection("Adds").where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).snapshots(),
  builder: (context, snapshot) {
    if(snapshot.hasError){
      
      return const Text("Error in fetching data");
    } else if(snapshot.connectionState == ConnectionState.waiting){
      final user = FirebaseAuth.instance.currentUser.toString();
      print(user);
      return const Expanded(child: Center(child: Text("Loading data ...")));
      
    } else {
      return Flexible(
        child: ListView(
          padding: EdgeInsets.zero,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            DocumentReference ref = document.reference;
            ServicesModel model = ServicesModel(
              name: data['name'].toString(),
              vidioPath: data['videoPath'].toString(),
              profilePath: data['profilePath'].toString(),
              catagory: data['catagory'].toString(),
              location: data['location'].toString(),
              email: data['email'].toString(),
              phone: data['phone'].toString(),
              facebook: data['facebook'].toString(),
              whatsapp: data['whatsapp'].toString(),
              linkedin: data['linkedin'].toString(),
              uid: data['uid'].toString()
            );
        
            return MyVideos(link: data['vidioPath'].toString(), model: model,ref:ref);
          }).toList(),
        ),
      );
    }
  }
)

          ],
        ),
        floatingActionButton: FloatingActionButton(

          onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const UploadPage()));
          },
          child:const Icon(Icons.add),

        )
        
    );
  }
}