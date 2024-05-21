import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:play/components/my_button.dart';
import 'package:play/components/my_label_text.dart';
import 'package:play/database_services/db_methods.dart';
import 'package:play/helper/dialog.dart';
import 'package:play/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final picker = ImagePicker();
  File? photoFile;
  bool isLoading = false;
  late TextEditingController name;
  late TextEditingController location;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController facebook;
  late TextEditingController whatsapp;
  late TextEditingController linkedin;
  late TextEditingController catagoryController;
  UserModel? userInfo;

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

  Future<void> initialized() async {
    final user = await getUserInfo();
    setState(() {
      userInfo = user;
      name.text = user?.name ?? '';
      location.text = user?.location ?? '';
      email.text = user?.email ?? '';
      phone.text = user?.phone ?? '';
      facebook.text = user?.facebook ?? '';
      whatsapp.text = user?.whatsapp ?? '';
      linkedin.text = user?.linkedin ?? '';
      catagoryController.text = user?.catagory ?? 'Cafe';
    });
  }

  Future<void> _imagePickerWithCamera() async {
    final photo = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      photoFile = File(photo!.path);
    });
  }

  Future<String?> upLoadImage() async {
    String time = DateTime.now().microsecondsSinceEpoch.toString();
    final firebaseStorage = FirebaseStorage.instance
        .ref()
        .child( time+ photoFile!.path.split("/").last)
        .putFile(photoFile!);
    final taskSnapshot = await firebaseStorage;

    final downloadLink = await taskSnapshot.ref.getDownloadURL();
    return downloadLink;
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: AppBar(
            elevation: 0,
            bottomOpacity: 0,
            title: const Text("Your profile"),
            backgroundColor: Theme.of(context).colorScheme.background,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            centerTitle: true,
          ),
        ),
      ),
      body: BuildUi(),
    );
  }

  @override
  void dispose() {
    name.dispose();
    location.dispose();
    email.dispose();
    phone.dispose();
    facebook.dispose();
    whatsapp.dispose();
    linkedin.dispose();
    catagoryController.dispose();
    super.dispose();
  }

  void updateMessage() {
    displayMessage("Information updated", context);
  }

  void updateInfo(UserModel user) async {

    showDialog(context: context, builder: (context)=> const AlertDialog(
        title: Text("Updating user info...."),

    ));
   
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    try{
       await updateUserInformation(user,  uid!);
      Navigator.pop(context);
       showDialog(context: context, builder: (context)=> const AlertDialog(
        title: Text("Updated"),

    ));

    }catch(e){
       Navigator.pop(context);
      displayMessage(e.toString(), context);
    }
  }

  Widget BuildUi() {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              _imagePickerWithCamera();
            },
            child: photoFile == null
                ? Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    child: userInfo == null
                        ? const Icon(
                            Icons.woman,
                            size: 130,
                            color: Colors.grey,
                          )
                        : ClipOval(child: Image.network(userInfo?.profilePath ?? " ",fit:BoxFit.cover)),
                  )
                : Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.file(
                        photoFile!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 10),
          MyTextFieldWithLabel(
            controller: name,
            hintText: "Your business name",
            isObscure: false,
          ),
          const SizedBox(height: 10),
          MyTextFieldWithLabel(
            controller: catagoryController,
            hintText: "Business Category",
            isObscure: false,
          ),
          const SizedBox(height: 10),
          MyTextFieldWithLabel(
            controller: location,
            hintText: "Your business location",
            isObscure: false,
          ),
          const SizedBox(height: 10),
          MyTextFieldWithLabel(
            controller: phone,
            hintText: "Your phone number",
            isObscure: false,
          ),
          const SizedBox(height: 10),
          MyTextFieldWithLabel(
            controller: email,
            hintText: "Your email address",
            isObscure: false,
          ),
          const SizedBox(height: 10),
          MyTextFieldWithLabel(
            controller: facebook,
            hintText: "Your Facebook link",
            isObscure: false,
          ),
          const SizedBox(height: 10),
          MyTextFieldWithLabel(
            controller: whatsapp,
            hintText: "Your WhatsApp link",
            isObscure: false,
          ),
          const SizedBox(height: 10),
          MyTextFieldWithLabel(
            controller: linkedin,
            hintText: "Your LinkedIn link",
            isObscure: false,
          ),
          const SizedBox(height: 20),
          MyButton(
            onTap: () async {
              String? downloadLink;

              if(photoFile!=null){
                  downloadLink = await upLoadImage();
              }
              String? profileImage = userInfo?.profilePath;
              if(downloadLink!=null){
                profileImage = downloadLink;
              }
            
              UserModel user = UserModel(
                name: name.text,
                profilePath: profileImage,
                catagory: catagoryController.text,
                location: location.text,
                email: email.text,
                phone: phone.text,
                facebook: facebook.text,
                whatsapp: whatsapp.text,
                linkedin: linkedin.text,
              );

              updateInfo(user);
              print("]nsaved button clicked\n");
            },
            text: "Save",
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  showStatus(bool status){
     if (status == true) {
      displayMessage("Updated", context);
    } else {
      displayMessage("Update failed", context);
    }
  }
}
