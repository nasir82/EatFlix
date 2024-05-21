
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:play/components/my_drawer.dart';
import 'package:play/components/video_component.dart';
import 'package:play/models/service_models.dart';
import 'package:play/pages/search_page.dart';
import 'package:flutter/material.dart';
class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    /**
     * default tabBarController 
     * legth and child
     * 
     * for enabling nested scroll we need to use nested scrollview
     */
    return DefaultTabController(
        length: 3,
        //child:
        //  Scaffold(
        //   appBar: AppBar(
        //     title: const Text("Appbar Demo"),
        //     centerTitle: true,
        //     bottom: const TabBar(
        //         indicatorSize: TabBarIndicatorSize.tab,
        //         indicatorColor: Colors.amber,
        //         unselectedLabelColor: Colors.grey,
        //         tabs: [
        //           Tab(
        //             icon: Icon(Icons.chat),
        //           ),
        //           Tab(
        //             icon: Icon(Icons.phone),
        //           ),
        //           Tab(
        //             icon: Icon(Icons.history),
        //           ),
        //         ]),
        //   ),
        //   body: const TabBarView(
        //     children: [ChatScreen(), PhoneScreen(), HistoryScreen()],
        //   ),
        // ),

        child: Scaffold(
          drawer:const MyDrawer(),
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScroll) {
                return [
                  
                   SliverAppBar(
                    pinned: true,
                    floating: false,
                     expandedHeight: 240,
                     collapsedHeight: 80,
                    elevation: 5,
                    flexibleSpace:FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 10,right: 20),
                        child: Row(
                        
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                         

                            GestureDetector(
                              onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (_)=>const SearchPage()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width*.7,
                                padding:const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).colorScheme.primary
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child:const Text("What do you want?")),
                            ),
                             const SizedBox(width:20 ,),
                              IconButton(onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>const SearchPage()));
                            }, icon:const Icon(Icons.search,size: 40,))
                          ],
                        ),
                      ),
                    ),
                    title:const Text("EatFlix"),
                    centerTitle: true,
                    bottom: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: Colors.amber,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            icon: Image.asset("assets/images/bar.png",fit: BoxFit.cover,height: 50,width: 40,),
                            text: "Bar",
                            height: 100,
                          ),
                          Tab(
                             icon: Image.asset("assets/images/cafe2.png",fit: BoxFit.cover,height: 50,width: 40,),
                            text: "Cafe",
                            height: 100,
                          ),
                          Tab(
                            icon: Image.asset("assets/images/restaurant.png",fit: BoxFit.cover,height: 50,width: 40,),
                            text: "Restaurant",
                            height: 100,
                          ),
                        ]),
                  ),
                ];
              },
              body: const TabBarView(
                  children: [ChatScreen(), PhoneScreen(), HistoryScreen()])),
        ));
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Adds").where('catagory', isEqualTo: "Bar").snapshots(),
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
                  }
          
                  return ListView(
                    padding: EdgeInsets.zero,
                    children:
                      
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      
                      ServicesModel model = ServicesModel(name: data['name'].toString(), vidioPath:  data['videoPath'].toString(),
                       profilePath:  data['profilePath'].toString(), catagory: data['catagory'].toString(), 
                       location: data['location'].toString(), email: data['email'].toString(),
                        phone: data['phone'].toString(), facebook: 
                       data['facebook'].toString(), whatsapp: data['whatsapp'].toString(),
                        linkedin: data['linkedin'].toString(), uid: data['uid'].toString());
                      return VideoComponent(link: data['vidioPath'].toString(),model: model);
                    }).toList(),
                  );
                },
              );
  }
}

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
//    Future<List<ServicesModel>> getItems(String category) async {
//   final QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("adds").get();

//   // Convert QuerySnapshot to a List<ServicesModel>
//   final List<ServicesModel> itemList = querySnapshot.docs.map((DocumentSnapshot documentSnapshot) {
//     final Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
//     return ServicesModel(
//       name: data['name'].toString(),
//       vidioPath: data['videoPath'].toString(),
//       profilePath: data['profilePath'].toString(),
//       catagory: data['catagory'].toString(),
//       location: data['location'].toString(),
//       email: data['email'].toString(),
//       phone: data['phone'].toString(),
//       facebook: data['facebook'].toString(),
//       whatsapp: data['whatsapp'].toString(),
//       linkedin: data['linkedin'].toString(),
//       uid: data['uid'].toString(),
//     );
//   }).toList();

//   return itemList;
// }


    return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Adds").where('catagory', isEqualTo: "Cafe").snapshots(),
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
                  }
          
                  return ListView(
                    padding: EdgeInsets.zero,
                    children:
                      
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      
                      ServicesModel model = ServicesModel(name: data['name'].toString(), vidioPath:  data['videoPath'].toString(),
                       profilePath:  data['profilePath'].toString(), catagory: data['catagory'].toString(), 
                       location: data['location'].toString(), email: data['email'].toString(),
                        phone: data['phone'].toString(), facebook: 
                       data['facebook'].toString(), whatsapp: data['whatsapp'].toString(),
                        linkedin: data['linkedin'].toString(), uid: data['uid'].toString());
                      return VideoComponent(link: data['vidioPath'].toString(),model: model);
                    }).toList(),
                  );
                },
              );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Adds").where('catagory', isEqualTo: "Restaurant").snapshots(),
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
                  }
          
                  return ListView(
                    padding: EdgeInsets.zero,
                    children:
                      
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      
                      ServicesModel model = ServicesModel(name: data['name'].toString(), vidioPath:  data['videoPath'].toString(),
                       profilePath:  data['profilePath'].toString(), catagory: data['catagory'].toString(), 
                       location: data['location'].toString(), email: data['email'].toString(),
                        phone: data['phone'].toString(), facebook: 
                       data['facebook'].toString(), whatsapp: data['whatsapp'].toString(),
                        linkedin: data['linkedin'].toString(), uid: data['uid'].toString());
                      return VideoComponent(link: data['vidioPath'].toString(),model: model);
                    }).toList(),
                  );
                },
              );
  }
}
