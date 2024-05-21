// import 'package:appinio_video_player/appinio_video_player.dart';
// import 'package:eatflix/models/service_models.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';


// class MyFrame extends StatefulWidget {

//   final ServicesModel model;

//   const MyFrame({super.key,required this.model});

//   @override
//   State<MyFrame> createState() => _MyFrameState();
// }

// class _MyFrameState extends State<MyFrame> {

//    CustomVideoPlayerController? _player;
//   bool isExpanded = false;
//   bool isPlay = false;
//   String myPath = "assets/video1.mp4";

//  @override
// void initState() {
//   super.initState();
//   videoPlayerInitialize();
// }

// void videoPlayerInitialize(){
//       CachedVideoPlayerController _videoController;
//       _videoController = CachedVideoPlayerController.asset(myPath)..initialize()
//       .then((value){
//         isPlay = true;
//       });
//       _player = CustomVideoPlayerController(context: context, videoPlayerController: _videoController);
// }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _player!.dispose();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return   SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(

//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
          
//               child: isPlay  ? CustomVideoPlayer(customVideoPlayerController:_player!) : Container(
//                 child: CustomVideoPlayer(customVideoPlayerController:_player!),
//               )
//               ),
//           ),
//       const SizedBox(
//               height: 10,
//             ),
//             isExpanded ? Container(
//               child: Row(
//                 children: [
//                  Text("Not expanded"),
//                  ElevatedButton(onPressed: (){
//                   setState(() {
//                     isExpanded = !isExpanded;
//                   });
//                  }, child: isExpanded ?  Text("See less"):Text("see more")),
//                 ],
//               ),
//             )
//             : Container(
//               child: Padding(
//                 padding:  EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
              
//                           Text("first row "+ widget.model.name.toString()),
//                       ],
//                     ),
//                     SizedBox(height: 5,),
//                     Row(
//                       children: [
                        
//                         Text("second row"),
              
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: Divider(
//               color: Theme.of(context).colorScheme.inversePrimary,
//             ),
//           )

//         ],
//       ),
//     );
//   }
// }