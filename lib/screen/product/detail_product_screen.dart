import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/controller/produk/product_controller.dart';
import 'package:tokoonline/model/sku/model_sku.dart';
import 'package:tokoonline/screen/checkout/checkout_screen.dart';
import 'package:tokoonline/utils/Utils.dart';
import 'package:tokoonline/utils/local_data.dart';
import 'package:tokoonline/widget/appbar_widget.dart';
import 'package:tokoonline/widget/material/button_green_widget.dart';

class DetailProductScreen extends StatefulWidget {
  ModelSKU? data;
  DetailProductScreen({Key? key, this.data}) : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {

  ProductController controller = Get.put(ProductController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(title: widget.data!.title),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.data!.image!,
                imageBuilder: (context, imageProvider) => Container(
                  width: double.infinity,
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => shimmerImage(context),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(widget.data!.title!, style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w500),),
                    SizedBox(height: 5),
                    Text(Utils.formatCurrency(double.parse(widget.data!.price!)), style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500),),
                    SizedBox(height: 25),
                    Text('Keterangan Produk', style: TextConstant.medium.copyWith(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500),),
                    SizedBox(height: 5),
                    Text(widget.data!.description!, style: TextConstant.medium.copyWith(color: Colors.black87,),),

                  ],
                ),
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Obx(()=>Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Container(
                  child: Stack(children: [
                    Icon(CupertinoIcons.cart, size: 30,),
                    controller.dataCart.value.length > 0 ? Positioned(
                      left: 20,
                      child: Container(
                        height: 13, width: 13,
                        decoration: DecorationConstant.boxCircle(color: Colors.redAccent),
                      ),
                    ):SizedBox()
                  ]),
                )),
                // SizedBox(width: size.width * 0.15),
                Container(
                  width: size.width * 0.27,
                  child: buttonBuy(),
                ),
                SizedBox(width: 10),
                Container(
                  width: size.width * 0.35,
                  child: buttonCart(widget.data!),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  shimmerImage(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      child: Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[300]!,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: size.height * 0.35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey),
              ),
            ],
          )),
    );
  }

  buttonBuy(){
    return GestureDetector(
      onTap: ()=>Get.to(()=>CheckOutScreen()),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        decoration: DecorationConstant.boxButton(radius: 8, color: Colors.green),
        child: Center(
          child: Text('Beli Sekarang', style: TextConstant.regular.copyWith(fontSize: 12, color: Colors.white)),
        ),
      ),
    );
  }

  buttonCart(ModelSKU modelSKU){
    return GestureDetector(
      onTap: () async {

        modelSKU.qty = 1;
        controller.saveToCart(modelSKU);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        decoration: DecorationConstant.boxButtonBorder(radius: 8, color: Colors.white, colorBorder: Colors.green, widthBorder: 1),
        child: Center(
          child: Text('Masukkan ke Keranjang', style: TextConstant.regular.copyWith(fontSize: 12, color: Colors.green)),
        ),
      ),
    );
  }
}
