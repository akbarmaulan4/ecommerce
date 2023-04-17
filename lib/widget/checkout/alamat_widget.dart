import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/controller/alamat/alamat_controller.dart';
import 'package:tokoonline/model/address/model_address.dart';
import 'package:tokoonline/screen/address/list_alamat_screen.dart';
import 'package:tokoonline/screen/address/tambah_alamat.dart';

class AlamatWidget extends StatelessWidget {
  AlamatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AlamatController controller = AlamatController();
    controller.getAlamat();
    return Obx(()=> controller.dataAlamat.value.alamat_type != null ? Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Alamat', style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w700),),
              GestureDetector(
                  onTap: ()=>Get.to(()=>ListAlamatScreen()),
                  child: Text('Pilih Alamat lain', style: TextConstant.medium.copyWith(color: Colors.green, fontSize: 16, fontWeight: FontWeight.w700),)),
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            margin: EdgeInsets.symmetric(vertical: 10),
            // decoration: DecorationConstant.boxButtonBorder(widthBorder: 1, colorBorder: Colors.grey.shade300, color: Colors.white, radius: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.dataAlamat.value!.alamat_type!, style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w700),),
                SizedBox(height: 10),
                Text(controller.dataAlamat.value!.detail_address!, style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500),),
                Divider()
              ],
            ),
          )
        ],
      ),
    ) : Column(
      children: [
        GestureDetector(
          onTap: ()=> Get.to(()=>TambahAlamatScreen())!.then((value) => controller.getAlamat()),
          child: Container(
            decoration: DecorationConstant.boxButtonBorder(
              colorBorder: Colors.green, widthBorder: 1, radius: 8, color: Colors.white
            ),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.green,),
                Text('Tambah Alamat'
                    '', style: TextConstant.medium.copyWith(color: Colors.green, fontSize: 16, fontWeight: FontWeight.w700),)
              ],
            ),
          ),
        ),
        Divider()
      ],
    )
    );
  }
}
