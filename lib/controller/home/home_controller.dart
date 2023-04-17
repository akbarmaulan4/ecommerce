
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tokoonline/api/api.dart';
import 'package:tokoonline/constant/dialog_constant.dart';
import 'package:tokoonline/model/auth/model_user.dart';
import 'package:tokoonline/model/banner/model_banner.dart';
import 'package:tokoonline/model/sku/model_category_sku.dart';
import 'package:tokoonline/model/sku/model_sku.dart';
import 'package:tokoonline/utils/local_data.dart';

class HomeController extends GetxController{

  RxInt posPage = 0.obs;
  RxString strUserName = ''.obs;
  RxList<ModelBanner?> dataBanner = <ModelBanner?>[].obs;
  RxList<ModelCategorySKU?> dataCategory = <ModelCategorySKU?>[].obs;
  RxList<ModelSKU> dataCart = <ModelSKU>[].obs;

  changePage(int val){
    posPage.value = val;
  }

  loadUser() async {
    var user = await LocalData.getData('user');
    var model = ModelUser.fromJson(jsonDecode(user));
    strUserName.value = model.username!;
  }

  loadCart() async {
    var data = await LocalData.getData('cart');
    if(data != ''){
      var json = jsonDecode(data);
      var carts = (json as List<dynamic>?)?.map((e) => ModelSKU.fromJson(e as Map<String, dynamic>)).toList();
      if(carts!.length > 0){
        dataCart.value = carts;
      }
    }
  }

  getBanner({BuildContext? context}){
    var post = new Map<String, dynamic>();
    var header = new Map<String, String>();

    header['Content-Type'] = 'application/json';

    // DialogConstant.loading(context!, 'Memperoses...');

    API.basePost('/get-banner-home.php', post, header, true, (result, error) {
      // Get.back();
      if(error != null){
        DialogConstant.alertError(error['message']);
      }
      if(result != null){
        List<ModelBanner?> model = (result['data'] as List).map((e) => e == null ? null : ModelBanner.fromJson(e as Map<String, dynamic>)).toList();
        dataBanner.value = model;
      }
    });
  }

  getItemCategory(){
    var post = new Map<String, dynamic>();
    var header = new Map<String, String>();

    header['Content-Type'] = 'application/json';

    // DialogConstant.loading(context!, 'Memperoses...');

    API.basePost('/get-product.php', post, header, true, (result, error) {
      // Get.back();
      if(error != null){
        DialogConstant.alertError(error['message']);
      }
      if(result != null){
        List<ModelCategorySKU?> model = (result['data'] as List).map((e) => e == null ? null : ModelCategorySKU.fromJson(e as Map<String, dynamic>)).toList();
        dataCategory.value = model;
      }
    });
  }
}