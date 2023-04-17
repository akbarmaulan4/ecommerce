
import 'dart:convert';

import 'package:get/get.dart';
import 'package:tokoonline/api/api.dart';
import 'package:tokoonline/constant/dialog_constant.dart';
import 'package:tokoonline/model/address/model_address.dart';
import 'package:tokoonline/model/payment/ModelPayment.dart';
import 'package:tokoonline/model/sku/model_sku.dart';
import 'package:tokoonline/utils/local_data.dart';

class CheckoutController extends GetxController{

  RxList<ModelPayment?> dataPayment = <ModelPayment?>[].obs;
  RxList<ModelSKU> dataCart = <ModelSKU>[].obs;

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

  getPaymentList(){
    var post = new Map<String, dynamic>();
    var header = new Map<String, String>();

    header['Content-Type'] = 'application/json';

    // DialogConstant.loading(context!, 'Memperoses...');

    API.basePost('/get-payment.php', post, header, true, (result, error) {
      // Get.back();
      if(error != null){
        DialogConstant.alertError(error['message']);
      }
      if(result != null){
        List<ModelPayment?> model = (result['data'] as List).map((e) => e == null ? null : ModelPayment.fromJson(e as Map<String, dynamic>)).toList();
        dataPayment.value = model;
      }
    });
  }

}