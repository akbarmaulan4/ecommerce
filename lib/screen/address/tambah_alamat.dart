import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/controller/alamat/alamat_controller.dart';
import 'package:tokoonline/widget/appbar_widget.dart';
import 'package:tokoonline/widget/material/button_green_widget.dart';

class TambahAlamatScreen extends StatelessWidget {
  const TambahAlamatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AlamatController controller = AlamatController();

    return Scaffold(
      appBar: AppBarWidget(title: 'Alamat'),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              section('Alamat Sebagai', controller.edtAlamatType),
              SizedBox(height: 10),
              section('Nama Penerima', controller.edtRecieverName),
              SizedBox(height: 10),
              section('Nomor Telepon Penerima', controller.edtRecieverPhone),
              SizedBox(height: 10),
              section('Email Penerima', controller.edtRecieverEmail),
              SizedBox(height: 10),
              section('Kota/Kecamatan', controller.edtCity),
              SizedBox(height: 10),
              section('Kode Pos', controller.edtPostalCode),
              SizedBox(height: 10),
              section('Detail Alamat', controller.edtdetailAddress),
              SizedBox(height: 10),
              section('Pesan', controller.edtNotes),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ButtonGreenWidget(
              onClick: ()=>controller.addAlamat(
                onResult: ()=>Get.back()
              ),
              text: 'Simpan',
            ),
          )
        ],
      ),
    );
  }



  section(String title, TextEditingController edt){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextConstant.regular.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 15),),
          Container(
            height: 40,
            child: TextField(
              maxLength: 25,
              controller: edt,
              obscureText: false,
              decoration: DecorationConstant.inputDecor().copyWith(hintText: title,counterText: '', contentPadding: EdgeInsets.only(top: 0)),
            ),
          )
        ],
      ),
    );
  }
}
