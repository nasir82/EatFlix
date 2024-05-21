
// ignore_for_file: constant_identifier_names

class ServicesModel{
   String name;
   String vidioPath;
   String profilePath;
   String location;
   String email;
   String phone;
   String catagory;
   String facebook;
   String whatsapp;
   String linkedin;
   String uid;

   ServicesModel({
    required this.name,
    required this.vidioPath,
    required this.profilePath,
    required this.catagory,
    required this.location,
    required this.email,
    required this.phone,
    required this.facebook,
    required this.whatsapp,
    required this.linkedin,
    required this.uid
    });
}

enum  CatagortClass{
  Bar,
  Cafe,
  Restaurent
}