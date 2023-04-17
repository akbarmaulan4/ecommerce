import 'package:flutter/material.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/model/address/model_address.dart';

class AlamatItem extends StatelessWidget {
  Function? onClik;
  ModelAdress? data;
  AlamatItem({Key? key, this.onClik, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onClik!(),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data!.alamat_type!, style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w700),),
            SizedBox(height: 10),
            Text(data!.detail_address!, style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }
}
