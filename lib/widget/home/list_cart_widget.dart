import 'package:flutter/material.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/model/sku/model_category_sku.dart';
import 'package:tokoonline/widget/cart/item_cart_widget.dart';

class ListCartWidget extends StatelessWidget {
  ModelCategorySKU? data;
  Function? onItemClick;
  ListCartWidget({Key? key, this.data, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data!.title!, style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w600),),
          Container(
            height:size.height * 0.23,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data!.data!.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: ()=>onItemClick!(data!.data![index]),
                  child: ItemCartWidget(fullwidth: false, dataSKU: data!.data![index])
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
