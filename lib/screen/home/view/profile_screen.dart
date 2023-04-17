import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/image_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/controller/auth_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var controller = AuthController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun', style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 18),),
        elevation: 0.5,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: size.height * 0.06),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: ()=>showPicker(context),
                    child: controller.filePhoto.value.path != '' ? Container(
                      decoration: DecorationConstant.boxCircle(),
                      child: ClipOval(
                        child: Image.file(controller.filePhoto.value, width: 80, height: 80, fit: BoxFit.cover),
                      )):CachedNetworkImage(
                      imageUrl: 'https://mmc.tirto.id/image/otf/500x0/2020/12/11/orangtuan-jungle_ratio-16x9.jpg',
                      imageBuilder: (context, imageProvider) => Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Expanded(child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nama User', style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5),
                        Text('email.user@gmail.com', style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 13),),
                        SizedBox(height: 2),
                        Text('0800111222', style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 12),)
                      ],
                    ),
                  ))
                ],
              ),
              SizedBox(height: 40),
              itemMenu('Data Akun', Icons.person),
              itemMenu('Daftar Alamat', Icons.not_listed_location),
              itemMenu('Keamanan Akun', Icons.lock),
              itemMenu('Tentang Aplikasi', Icons.phone_android_rounded),
              itemMenu('Keluar', Icons.exit_to_app_rounded),
            ],
          ),
        ),
      ),
    );
  }

  itemMenu(String title, IconData icons){
    return Container(
      decoration: DecorationConstant.boxButtonBorder(
          radius: 8, color: Colors.white, widthBorder: 1, colorBorder: Colors.grey.shade300
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icons),
          SizedBox(width: 15),
          Text(title, style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 15),)
        ],
      ),
    );
  }

  showPicker(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
        maxWidth: 1024,
        maxHeight: 768);
    if(pickedFile != null){
      var image = File(pickedFile.path);
      controller.filePhoto.value = image;
    }
  }

  _imgFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxWidth: 1024,
        maxHeight: 768);
    if(pickedFile != null){
      var image = File(pickedFile.path);
      controller.filePhoto.value = image;
    }
  }
}
