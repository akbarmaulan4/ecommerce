import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/dialog_constant.dart';
import 'package:tokoonline/constant/image_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/controller/auth_controller.dart';
import 'package:tokoonline/widget/material/button_green_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {

  AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: ()=>Get.back(),
          child: Icon(CupertinoIcons.back, color: Colors.black87)
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              Center(child: Image.asset(ImageConstant.cart_logo, height: size.height * 0.15)),
              SizedBox(height: 45),
              Text('Daftar', style: TextConstant.regular.copyWith(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black87),),
              SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama', style: TextConstant.regular.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 15),),
                    Container(
                      height: 40,
                      child: TextField(
                        maxLength: 25,
                        controller: controller.edtNama,
                        keyboardType: TextInputType.text,
                        decoration: DecorationConstant.inputDecor().copyWith(hintText: "Masukkan Nama",counterText: '', contentPadding: EdgeInsets.only(top: 0)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email', style: TextConstant.regular.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 15),),
                    Container(
                      height: 40,
                      child: TextField(
                        maxLength: 25,
                        controller: controller.edtEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: DecorationConstant.inputDecor().copyWith(hintText: "Masukkan Email",counterText: '', contentPadding: EdgeInsets.only(top: 0)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('No. Telepon', style: TextConstant.regular.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 15),),
                    Container(
                      height: 40,
                      child: TextField(
                        maxLength: 25,
                        controller: controller.edtNohp,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12),
                          FilteringTextInputFormatter.deny(RegExp('[\\-|\\,|\\.|\\#|\\*]'))
                        ],
                        decoration: DecorationConstant.inputDecor().copyWith(hintText: "Masukkan nomor teleponmu",counterText: '', contentPadding: EdgeInsets.only(top: 0)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kata Sandi', style: TextConstant.regular.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 15),),
                    Container(
                      height: 40,
                      child: TextField(
                        maxLength: 25,
                        controller: controller.edtPass,
                        obscureText: true,
                        decoration: DecorationConstant.inputDecor().copyWith(hintText: "Masukkan Kata Sandi",counterText: '', contentPadding: EdgeInsets.only(top: 0)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Konfirmasi Kata Sandi', style: TextConstant.regular.copyWith(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 15),),
                    Container(
                      height: 40,
                      child: TextField(
                        maxLength: 25,
                        controller: controller.edtConfirmPass,
                        obscureText: true,
                        decoration: DecorationConstant.inputDecor().copyWith(hintText: "Masukkan Konfirmasi Kata Sandi",counterText: '', contentPadding: EdgeInsets.only(top: 0)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 35),
              ButtonGreenWidget(text: 'Daftar', onClick: ()=>controller.postRegister(
                context: context,
                callback: (result, error){
                  if(result != null){
                    if(result['error'] == true){
                      DialogConstant.alertError(result['message']);
                    }else{
                      DialogConstant.alertError('Pendaftaran Berhasil', function: (){
                        controller.edtNama.text = '';
                        controller.edtEmail.text = '';
                        controller.edtNohp.text = '';
                        controller.edtPass.text = '';
                        controller.edtConfirmPass.text = '';
                        Get.back();
                      });
                    }
                  }
                  if(error != null){
                    DialogConstant.alertError('Pendaftaran Gagal');
                  }
                }
              ),),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: ()=>Get.back(),
                  child: RichText(
                    text: TextSpan(
                      text: 'Sudah punya akun ? ',
                      style: TextConstant.regular,
                      children: <TextSpan>[
                        TextSpan(text: 'Login', style: TextConstant.regular.copyWith(
                            color: Colors.green
                        )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
