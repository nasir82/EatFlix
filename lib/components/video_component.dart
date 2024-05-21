import 'package:chewie/chewie.dart';
import 'package:play/components/icons.dart';
import 'package:flutter/material.dart';
import 'package:play/components/text_box.dart';
import 'package:play/models/service_models.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class VideoComponent extends StatefulWidget {

  final String link;
  final ServicesModel model;
  const VideoComponent({super.key,required this.link,required this.model});


  @override
  _VideoComponentState createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent> {
  late VideoPlayerController _player;

  late ChewieController chewieController;
  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
    _player = VideoPlayerController.networkUrl(Uri.parse(widget.link))..initialize();
    chewieController = ChewieController(videoPlayerController: _player);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: AspectRatio(
                aspectRatio: _player.value.aspectRatio,
                child: Chewie(controller: chewieController),
              ),
            ),
           const SizedBox(height: 10,),
            isExpanded
              ? Container(
                margin:const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           ClipOval(
                              child: CircleAvatar(
                              child: Image.network(widget.model.profilePath.toString(),fit: BoxFit.cover,),
                          )),
                          TextBox(hintText: widget.model.name,siz: .6,),
                          //IconCustom(icon: Icons.language, size: 20, info: "Akhalia,Sylhet"),
                         
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: const TextBox(hintText: "Details",siz: .3,))
                        ],
                      ),
                    )
                  ],
                ),
              )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 ClipOval(
                                    child: CircleAvatar(
                                  child: Image.network(widget.model.profilePath,),
                                )),
                                TextBox(hintText: widget.model.name,siz: .6,),
                                const  Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isExpanded = !isExpanded;
                                      });
                              
                                    },
                                    child: const TextBox(hintText: "Less",siz: .3,))
                              ],
                            ),
                          ),
                                          
                         SizedBox(
                            height: 80,
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              IconCustom(icon: Icons.language, size: 40, 
                              info: widget.model.location,onTap:()async {
                                 
                                 
                                 
                                },),
                              IconCustom(icon: Icons.phone, size: 40, info: widget.model.phone, onTap: () async{
                                  await launcher.launchUrl(Uri.parse('tel:${widget.model.phone}'));
                              
                                },),
                              IconCustom(icon: Icons.verified, size: 40, info: "WhatsApp", onTap: () async{
                                  await launcher.launchUrl(Uri.parse('https://wa.me/+88001731812645'));
                                },)
                                          
                              ],
                            ),
                          ),
                        SizedBox(
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              IconCustom(icon: Icons.email, size: 40, info: widget.model.email,onTap: () async{
                                  await launcher.launchUrl(Uri.parse('mailto:${widget.model.email}'));
                                },),
                               IconCustom(icon: Icons.telegram, size: 40, info: "LinkedIn",onTap: () async{
                                  await launcher.launchUrl(Uri.parse(widget.model.linkedin));
                                },),
                               IconCustom(icon: Icons.facebook, size: 40, info: "Facebook", onTap: () async{
                                  await launcher.launchUrl(Uri.parse(widget.model.facebook));
                                },)
                             ],
                            ),
                          ),
            
                        ],
                      ),
                    ),
                  ),
                )
          ],
        );
  }
}
