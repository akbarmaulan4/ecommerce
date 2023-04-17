import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/model/sku/model_sku.dart';
import 'package:tokoonline/utils/Utils.dart';

class ItemCartCheckoutWidget extends StatelessWidget {
  ModelSKU? data;
  ItemCartCheckoutWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: DecorationConstant.boxRadiusShadowOnly(
                color: Colors.white,
                topRight: 8, topLeft: 8, bottomRight: 8, bottomLeft: 8,
                spreadRadius: 0.5, offset: Offset(0, 0), blurRadius: 3, colorShadow: Colors.grey.shade300
            ),
            child: CachedNetworkImage(
              imageUrl: data!.image!,
              imageBuilder: (context, imageProvider) => Container(
                width: size.height * 0.08,
                height: size.height * 0.08,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8)),
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => shimmerCard(context),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(width: 10),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(data!.title!, style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w600),)
                ),
                SizedBox(height: 5),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(Utils.formatCurrency(double.parse(data!.price!)), style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 10),)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  shimmerCard(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.height * 0.08,
      height: size.height * 0.08,
      decoration: DecorationConstant.boxRadiusOnly(topLeft: 8, topRight: 8),
      child: Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[300]!,
          child: Column(
            children: <Widget>[
              Container(
                width: size.height * 0.08,
                height: size.height * 0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey),
              ),
            ],
          )),
    );
  }
}
