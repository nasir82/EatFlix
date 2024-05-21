// import 'package:chewie/chewie.dart';
// import 'package:play/components/text_box.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class FinalFrame extends StatefulWidget {
//   const FinalFrame({super.key});

//   @override
//   State<FinalFrame> createState() => _FinalFrameState();
// }

// class _FinalFrameState extends State<FinalFrame> {
//   late VideoPlayerController _player;
//   late ChewieController chewieController;
//   bool isExpanded = true;
//   String myPath = "assets/restaurant.mp4";

//   @override
//   void initState() {
//     super.initState();

//     _player = VideoPlayerController.asset(myPath);
//     chewieController = ChewieController(videoPlayerController: _player);
//   }


    

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _player.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//         children: [
//           Chewie(controller: chewieController),
//           isExpanded
//               ? Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Theme.of(context).colorScheme.primary
//                       ),
//                       borderRadius: BorderRadius.circular(10)
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 60,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const ClipOval(
//                                   child: CircleAvatar(
//                                 child: Icon(
//                                   Icons.person,
//                                   size: 40,
//                                 ),
//                               )),
//                               const TextBox(hintText: "Md. Nasir Uddin"),
//                               TextBox(hintText: "Akhalia"),
//                               GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       isExpanded = !isExpanded;
//                                     });
//                                   },
//                                   child: const TextBox(hintText: "Details"))
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               : Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
//                   child: Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Theme.of(context).colorScheme.primary
//                       ),
//                       borderRadius: BorderRadius.circular(10)
//                     ),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 60,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const ClipOval(
//                                     child: CircleAvatar(
//                                   child: Icon(
//                                     Icons.person,
//                                     size: 40,
//                                   ),
//                                 )),
//                                 const TextBox(hintText: "Md. Nasir Uddin"),
//                                 Expanded(child: SizedBox()),
//                                 GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         isExpanded = !isExpanded;
//                                       });
//                                       print("taped");
//                                     },
//                                     child: const TextBox(hintText: "Less"))
//                               ],
//                             ),
//                           ),
                    
//                       const   SizedBox(
//                             height: 50,
//                             child: Row(
//                               children: [
//                               TextBox(hintText: "akhalila,sylhet-3100"),
//                               TextBox(hintText: "017318126"),
                    
//                               ],
//                             ),
//                           ),
//                        const SizedBox(
//                             height: 50,
//                             child: Row(
//                               children: [
//                               TextBox(hintText: "ab@gmail.com"),
//                               TextBox(hintText: "facebook"),
//                               TextBox(hintText: "teligram"),
                             
//                              ],
//                             ),
//                           ),
//                        const  SizedBox(
//                             height: 50,
//                             child: Row(
//                               children: [
//                               TextBox(hintText: "instagram"),
//                               TextBox(hintText: "website"),
//                               TextBox(hintText: "facebook "),
                              
//                              ],
//                             ),
//                           ),
                       
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//         ],
//       );
//   }
// }