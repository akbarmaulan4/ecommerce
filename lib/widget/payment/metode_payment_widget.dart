import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/image_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/model/payment/ModelPayment.dart';

class MetodePaymentWidget extends StatelessWidget {
  ModelPayment? data;
  MetodePaymentWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DecorationConstant.boxButtonBorder(
        color: Colors.white,
        radius: 8,
        widthBorder: 1,
        colorBorder: Colors.grey.shade200
      ),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: data!.image!,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Image.asset(ImageConstant.cart_logo, height: 24),
                  errorWidget: (context, url, error) => Image.asset(ImageConstant.cart_logo, height: 24),
              ),
              SizedBox(width: 15),
              Text('JNE', style: TextConstant.regular.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.album_outlined)
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
