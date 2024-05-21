import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:play/components/my_button.dart';
import 'package:play/components/text_field.dart';
import 'package:play/database_services/db_methods.dart';
import 'package:play/helper/dialog.dart';
import 'package:play/models/service_models.dart';
import 'package:play/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _selectedVideo;
  VideoPlayerController? _controller;

  late TextEditingController name;
  late TextEditingController location;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController facebook;
  late TextEditingController whatsapp;
  late TextEditingController linkedin;
  late TextEditingController catagoryController;

  bool isProgress = true;

  final picker = ImagePicker();
  UserModel? user;

   Future<UserModel?> getUserInfo() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        final userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .get();
        if (userSnapshot.exists) {
          print("data ache");
          return UserModel.fromDocumentSnapshot(userSnapshot);
        } else {
          print('User document does not exist');
          print("${currentUser.uid}");
          return null;
        }
      } catch (e) {
        print('Error fetching user data: $e');
        return null;
      }
    } else {
      print('Current user is null');
      return null;
    }
  }
  @override
  void initState() {
    super.initState();
     name = TextEditingController();
     location = TextEditingController();
     email = TextEditingController();
     phone = TextEditingController();
     facebook = TextEditingController();
     whatsapp = TextEditingController();
     linkedin = TextEditingController();
     catagoryController = TextEditingController();
    initialized();
  }
  void initialized() async{

   user =  await getUserInfo();

   name.text = user?.name ?? '';
   location.text = user?.location ?? '';
   email.text = user?.email ?? '';
   phone.text = user?.phone ?? '';
   facebook.text = user?.facebook ?? '';
   whatsapp.text = user?.whatsapp ?? '';
   linkedin.text = user?.linkedin ?? '';
   catagoryController.text = user?.catagory ?? '';



  }

  Future<String?> upLoadVideo() async {
    UploadTask firebaseStorage = FirebaseStorage.instance
        .ref()
        .child("video-" + _selectedVideo!.path.split("/").last)
        .putFile(_selectedVideo!);
    TaskSnapshot taskSnapshot = await firebaseStorage;

    String downloadLink = await taskSnapshot.ref.getDownloadURL();
    return downloadLink;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          margin:const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            elevation: 0,
            bottomOpacity: 0,
            title: const Text("Upload an content"),
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            centerTitle: true,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () async {
                  _imagePickerWithCamera();
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.background,
                    ),
                    child: Center(
                      child: Text(
                        "Pickup your add",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
            if (_controller != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                    child: AspectRatio(
                        aspectRatio: 16 / 10,
                        child: VideoPlayer(_controller!))),
              )
            else
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  " No add Selected ",
                  style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            MyTextField(
                controller: name,
                hintText: "Your buisness name",
                isObscure: false),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.tertiary
                )
              ),
              child: DropdownMenu(
                trailingIcon:const Icon(Icons.arrow_drop_down,color: Colors.black87,),
                controller: catagoryController,
                width: MediaQuery.of(context).size.width*.9,
                dropdownMenuEntries: <DropdownMenuEntry<String>>[
                  DropdownMenuEntry(value: CatagortClass.Bar.toString(), label:"Bar" ),
                  DropdownMenuEntry(value: CatagortClass.Cafe.toString(), label:"Cafe" ),
                  DropdownMenuEntry(value: CatagortClass.Restaurent.toString(), label:"Restaurant" )
                ]),
            ),
            
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: location,
                hintText: "Your buisness location",
                isObscure: false),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: phone,
                hintText: "Your phone number",
                isObscure: false),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: email,
                hintText: "Your email address",
                isObscure: false),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: facebook,
                hintText: "Your facebook link",
                isObscure: false),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: whatsapp,
                hintText: "Your whatsApp link",
                isObscure: false),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: linkedin,
                hintText: "Your linedin link",
                isObscure: false),
            const SizedBox(
              height: 20,
            ),
           
            const SizedBox(
              height: 20,
            ),
            MyButton(
                onTap: () async {
                  if (name.text.isEmpty ||
                      location.text.isEmpty ||
                      catagoryController.text.isEmpty ||
                      phone.text.isEmpty ||
                      email.text.isEmpty ||
                      facebook.text.isEmpty ||
                      whatsapp.text.isEmpty ||
                      linkedin.text.isEmpty) {
                    displayMessage(
                        "Please fill up all the information", context);
                  } else {
                    if (isProgress) {
                      showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                                title: Text('Uploading data...'),
                              ));
                    }

                    String? downloadLink = await upLoadVideo();
                    if (downloadLink != null) {
                      String? uid = FirebaseAuth.instance.currentUser?.uid;
                      ServicesModel model = ServicesModel(
                          name: name.text,
                          vidioPath: downloadLink,
                          profilePath: "profilePath",
                          catagory: catagoryController.text,
                          location: location.text,
                          email: email.text,
                          phone: phone.text,
                          facebook: facebook.text,
                          whatsapp: whatsapp.text,
                          linkedin: linkedin.text,
                          uid: uid!);

                      try {
                        final res = await upLoadReourses(model);
                        setState(() {
                          isProgress = false;
                        });
                        Navigator.pop(context);

                        if (res) {
                          displayMessage("Uploaded data", context);
                        } else {
                          displayMessage("Upload fail", context);
                        }
                      } catch (e) {
                        Navigator.pop(context);
                        setState(() {
                          isProgress = false;
                        });

                        displayMessage(e.toString(), context);
                      }
                    } else {
                      displayMessage("Erron in video upload", context);
                    }
                  }
                },
                text: "Upload"),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future _imagePickerWithCamera() async {
    final photo = await ImagePicker().pickVideo(source: ImageSource.gallery);

    setState(() {
      _selectedVideo = File(photo!.path);
      _controller = VideoPlayerController.file(_selectedVideo!);
      _controller!.initialize();
      _controller!.play();
      _controller!.setVolume(3);
      _controller!.setLooping(true);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();

  }
}
