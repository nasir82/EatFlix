import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:play/components/video_component.dart';

import 'package:flutter/material.dart';
import 'package:play/models/service_models.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  String? pat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find your nearest one"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SearchBar(
              controller: search,
              leading: const Icon(Icons.search),
              hintText: 'Search by location',
              onChanged: (_) {
                // showDialog(context: context, builder: (_)=>const AlertDialog(
                //   title: Text("Delete?\n "),
                // ));
              },
              onSubmitted: (_) async {
                if (search.text.isNotEmpty) {
                  setState(() {
                    pat = search.text;
                  });
                }
              },
            ),
          ),
          pat == null
              ? const Center(
                child: Text("Search a Bar, Cafe or Restaurant",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              
                ),),
              )
              : StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection("Adds").snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Expanded(
                        child: Column(
                          children: [
                            Center(child: Text("Loading")),
                          ],
                        ),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text("No such data"),
                      );
                    }

                    return Flexible(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: snapshot.data!.docs
                            .where((DocumentSnapshot document) {
                          // Filter documents based on location matching search text
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          String location =
                              data['location'].toString().toLowerCase();
                          String searchText = pat!.toLowerCase();
                          return location.contains(searchText);
                        }).map((DocumentSnapshot document) {
                          // Create ServicesModel from filtered documents
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
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
                            uid: data['uid'].toString(),
                          );
                          return VideoComponent(
                              link: data['vidioPath'].toString(), model: model);
                        }).toList(),
                      ),
                    );
                  },
                )
        ],
      ),
    );
  }
}
