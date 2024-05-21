import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:play/components/video_component.dart';
import 'package:play/models/service_models.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Adds").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView(
          padding: EdgeInsets.zero,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
                ServicesModel model = ServicesModel(name: data['name'].toString(), vidioPath:  data['videoPath'].toString(),
                       profilePath:  data['profilePath'].toString(), catagory: data['catagory'].toString(), 
                       location: data['location'].toString(), email: data['email'].toString(),
                        phone: data['phone'].toString(), facebook: 
                       data['facebook'].toString(), whatsapp: data['whatsapp'].toString(),
                        linkedin: data['linkedin'].toString(), uid: data['uid'].toString());
            return  VideoComponent(link: data['vidioPath'].toString(),model: model);
          }).toList(),
        );
      },
    );
  }
}
