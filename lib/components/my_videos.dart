
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:play/models/service_models.dart';
import 'package:video_player/video_player.dart';

class MyVideos extends StatefulWidget {
  final String link;
  final ServicesModel model;
  final DocumentReference ref;
  const MyVideos({super.key, required this.link, required this.model, required this.ref});

  @override
  _VideoComponentState createState() => _VideoComponentState();
}

class _VideoComponentState extends State<MyVideos> {
  late VideoPlayerController _player;

  late ChewieController chewieController;
  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
    _player = VideoPlayerController.networkUrl(Uri.parse(widget.link))
      ..initialize();
    chewieController = ChewieController(videoPlayerController: _player);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: AspectRatio(
            aspectRatio: _player.value.aspectRatio,
            child: Chewie(controller: chewieController),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                        child: CircleAvatar(
                      child: Image.network(
                        widget.model.profilePath.toString(),
                        fit: BoxFit.cover,
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(widget.model.name)),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.update_sharp)),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: ()async {

                      showDialog(context: context, builder: (context)=>const AlertDialog(
                        title: Text("Deleting item"),
                      ));
                      try{
                        await widget.ref.delete();
                        Navigator.pop(context);
                        ChangeNotifier();
                         showDialog(context: context, builder: (context)=>const AlertDialog(
                        title: Text("Deleted"),
                      ));
                      }catch(e){

                        Navigator.pop(context);
                         showDialog(context: context, builder: (context)=> AlertDialog(
                        title: Text(e.toString()),
                      ));
                      }
                      
                    }, icon: const Icon(Icons.delete))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
