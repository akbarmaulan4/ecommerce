

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tokoonline/constant/dialog_constant.dart';
import 'package:tokoonline/model/address/model_address.dart';
import 'package:tokoonline/model/auth/model_user.dart';
import 'package:tokoonline/utils/local_data.dart';

class AlamatController extends GetxController{

  Rx<ModelAdress> dataAlamat = ModelAdress().obs;
  RxList<ModelAdress> dataListAlamat = <ModelAdress>[].obs;

  TextEditingController edtAlamatType = TextEditingController();
  TextEditingController edtRecieverName = TextEditingController();
  TextEditingController edtRecieverEmail = TextEditingController();
  TextEditingController edtRecieverPhone = TextEditingController();
  TextEditingController edtCity = TextEditingController();
  TextEditingController edtPostalCode = TextEditingController();
  TextEditingController edtdetailAddress = TextEditingController();
  TextEditingController edtNotes = TextEditingController();

  // loadUser() async {
  //   var user = await LocalData.getData('user');
  //   var model = ModelUser.fromJson(jsonDecode(user));
  //   strUserName.value = model.username!;
  // }

  getAlamat() async{
    var data = await LocalData.getData('alamat');
    if(data != ''){
      var json = jsonDecode(data);
      List<ModelAdress>? listAlamat = (json as List<dynamic>?)?.map((e) => ModelAdress.fromJson(e as Map<String, dynamic>)).toList();
      if(listAlamat![0].alamat_type != null){
        dataAlamat.value = listAlamat[0];
      }
    }
  }

  getListAlamat() async{
    var data = await LocalData.getData('alamat');
    if(data != ''){
      var json = jsonDecode(data);
      List<ModelAdress>? listAlamat = (json as List<dynamic>?)?.map((e) => ModelAdress.fromJson(e as Map<String, dynamic>)).toList();
      if(listAlamat!.length > 0){
        dataListAlamat.value = listAlamat;
      }
    }
  }

  addAlamat({Function? onResult}) async{
    var data = await LocalData.getData('alamat');
    // var dataUser = await LocalData.getData('user');
    // var user = ModelUser.fromJson(jsonDecode(dataUser));
    if(data != ''){
      var json = jsonDecode(data);
      List<ModelAdress>? listAlamat = (json as List<dynamic>?)?.map((e) => ModelAdress.fromJson(e as Map<String, dynamic>)).toList();

      ModelAdress alamat = ModelAdress();
      alamat.alamat_type = edtAlamatType.text;
      alamat.reciever_name = edtRecieverName.text;
      alamat.reciever_email = edtRecieverEmail.text;
      alamat.reciever_phone = edtRecieverPhone.text;
      alamat.city = edtCity.text;
      alamat.postal_code = edtPostalCode.text;
      alamat.detail_address = edtdetailAddress.text;
      alamat.notes = edtNotes.text;
      listAlamat?.add(alamat);

      LocalData.removeData('alamat');
      LocalData.saveData('alamat', jsonEncode(listAlamat));

    }else{
      List<ModelAdress> listAlamat = [];
      ModelAdress alamat = ModelAdress();
      alamat.alamat_type = edtAlamatType.text;
      alamat.reciever_name = edtRecieverName.text;
      alamat.reciever_email = edtRecieverEmail.text;
      alamat.reciever_phone = edtRecieverPhone.text;
      alamat.city = edtCity.text;
      alamat.postal_code = edtPostalCode.text;
      alamat.detail_address = edtdetailAddress.text;
      alamat.notes = edtNotes.text;
      listAlamat.add(alamat);
      LocalData.removeData('alamat');
      LocalData.saveData('alamat', jsonEncode(listAlamat));
    }

    DialogConstant.showConfirmDialog('Informasi', 'Alamat berhasil disimpan', () {
      onResult!();
    });
  }
}