
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tokoonline/api/api.dart';
import 'package:tokoonline/constant/dialog_constant.dart';
import 'package:tokoonline/model/auth/model_user.dart';

class AuthController extends GetxController{

  RxBool openPassLogin = true.obs;
  Rx<File> filePhoto = File('').obs;
  TextEditingController edtNama = TextEditingController();
  TextEditingController edtEmail = TextEditingController();
  TextEditingController edtNohp = TextEditingController();
  TextEditingController edtPass = TextEditingController();
  TextEditingController edtConfirmPass = TextEditingController();

  changeOpenPassLogin(bool val){
    openPassLogin.value = val;
  }

  validation({BuildContext? context, void callback(result, exception)?}){
    if(edtNohp.text == ''){
      // Get.snackbar('Title', 'salah woou');
      DialogConstant.alertError('No Handpone tidak boleh kosong!');
    }else if(edtPass.text == ''){
      DialogConstant.alertError('Password tidak boleh kosong!');
    }else{
      postLogin(
        context: context,
        callback: (result, error)=>callback!(result, error)
      );
    }
  }

  postLogin({
    BuildContext? context,
    void callback(result, exception)?}){
    var post = new Map<String, dynamic>();
    var header = new Map<String, String>();

    header['Content-Type'] = 'application/json';
    post['phone'] = edtNohp.text;
    post['password'] = edtPass.text;

    DialogConstant.loading(context!, 'Memperoses...');

    API.basePost('/login.php', post, header, true, (result, error) {
      Get.back();
      if(error != null){
        callback!(null, error);
      }
      if(result != null){
        callback!(result, null);
      }
    });
  }

  validationRegister({BuildContext? context, void callback(result, exception)?}){
    if(edtNama.text == ''){
      DialogConstant.alertError('Nama tidak boleh kosong!');
    }else if(edtEmail.text == ''){
      DialogConstant.alertError('Email tidak boleh kosong!');
    }else if(edtNohp.text == ''){
      DialogConstant.alertError('Nomor Telepon tidak boleh kosong!');
    }else if(edtPass.text == ''){
      DialogConstant.alertError('Password tidak boleh kosong!');
    }else if(edtConfirmPass.text == ''){
      DialogConstant.alertError('Konfirmasi Password tidak boleh kosong!');
    }else if(edtPass.text != edtConfirmPass.text){
      DialogConstant.alertError('Password dan Konfirmasi Password tidak sama!');
    }else{
      postRegister(
          context: context,
          callback: (result, error)=>callback!(result, error)
      );
    }
  }

  postRegister({
    BuildContext? context,
    void callback(result, exception)?}){
    var post = new Map<String, dynamic>();
    var header = new Map<String, String>();

    header['Content-Type'] = 'application/json';
    post['username'] = edtNama.text;
    post['email'] = edtEmail.text;
    post['phone'] = edtNohp.text;
    post['password'] = edtPass.text;

    DialogConstant.loading(context!, 'Memperoses...');

    API.basePost('/register.php', post, header, true, (result, error) {
      Get.back();
      if(error != null){
        callback!(null, error);
      }
      if(result != null){
        callback!(result, null);
      }
    });
  }
}