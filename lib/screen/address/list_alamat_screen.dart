import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/controller/alamat/alamat_controller.dart';
import 'package:tokoonline/screen/address/tambah_alamat.dart';
import 'package:tokoonline/widget/address/alamat_item.dart';
import 'package:tokoonline/widget/appbar_widget.dart';
import 'package:tokoonline/widget/checkout/alamat_widget.dart';

class ListAlamatScreen extends StatelessWidget {
  const ListAlamatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AlamatController controller = AlamatController();
    controller.getListAlamat();
    return Scaffold(
      appBar: AppBarWidget(title: 'Alamat'),
      body: Obx(()=>Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: ()=>Get.to(()=>TambahAlamatScreen()),
                      child: Text('Tambah Alamat', style: TextConstant.medium.copyWith(color: Colors.green, fontSize: 16, fontWeight: FontWeight.w700),)),
                  Icon(Icons.add, color: Colors.green,)
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: controller.dataListAlamat.value.length,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: DecorationConstant.boxButtonBorder(
                          color: Colors.white, radius: 8, colorBorder: Colors.grey.shade300, widthBorder: 1
                      ),
                      child: AlamatItem(
                        data: controller.dataListAlamat.value[index],
                        onClik: ()=>Get.back(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
