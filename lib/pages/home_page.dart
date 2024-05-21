
import 'package:play/components/my_drawer.dart';
import 'package:play/components/my_page.dart';
import 'package:play/components/my_searchview.dart';
import 'package:play/components/my_silver_appbar.dart';
import 'package:play/components/tab_row.dart';
import 'package:play/models/service_models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  //sort out and return the list of food according to category
  List<ServicesModel> _filterMenuByCatagory(
      CatagortClass catagory, List<ServicesModel> fullMenu) {
    return fullMenu
        .where((modelServices) => modelServices.catagory != catagory.toString())
        .toList();
  }

  List<Widget> getFoodInThisCatagory(List<ServicesModel> fullMenu) {
    return CatagortClass.values.map((catagory) {
      List<ServicesModel> catagoryMenu =
          _filterMenuByCatagory(catagory, fullMenu);

      return ListView.builder(
        itemCount: catagoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          
          return Text(" ");
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySilverAppbar(
              controller: _controller,
              // title is gonna be a colum
              title: Padding(
                padding: const EdgeInsets.only(
                  bottom: 80,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MySearchView(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Image.asset(
                                  "assets/images/bar.png",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Image.asset(
                                  "assets/images/cafe2.png",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Image.asset(
                                  "assets/images/restaurant.png",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          thickness: 1,
                          color: Theme.of(context).colorScheme.secondary,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ),

                      // Divider(thickness: 1,color: Theme.of(context).colorScheme.primary,),
                    ],
                  ),
                ),
              ),
              //child gonna be tapbar
              child: const MyTabRow(),
            )
          ],
          
          body:MyPage(),
        ));
  }
}