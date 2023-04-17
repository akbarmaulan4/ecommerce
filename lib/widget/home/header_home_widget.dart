import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/controller/home/home_controller.dart';

class HeaderHomeWidget extends StatelessWidget {
  Function? onSearch;
  Function? onCheckout;
  HeaderHomeWidget({Key? key, this.onSearch, this.onCheckout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    HomeController controller = HomeController();
    controller.loadUser();
    controller.loadCart();
    return Obx(()=>Container(
      color: Colors.green,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.035,),
          Row(
            children: [
              Text('Hi, ${controller.strUserName}', style: TextConstant.medium.copyWith(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Stack(children: [
                        Icon(CupertinoIcons.cart, color: Colors.white,),
                        controller.dataCart.value.length > 0 ? Positioned(
                          left: 15,
                          child: Container(
                            height: 10, width: 10,
                            decoration: DecorationConstant.boxCircle(color: Colors.redAccent),
                          ),
                        ):SizedBox()
                      ]),
                    ),
                    onTap: ()=>onCheckout!(),
                  ),
                  SizedBox(width: 10),
                  CachedNetworkImage(
                    imageUrl: 'https://mmc.tirto.id/image/otf/500x0/2020/12/11/orangtuan-jungle_ratio-16x9.jpg',
                    imageBuilder: (context, imageProvider) => Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                ],
              ))
            ],
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: ()=>onSearch!(),
            child: Container(
              decoration: DecorationConstant.boxButton(radius: 8, color: Colors.white),
              height: 40,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Icon(CupertinoIcons.search, color: Colors.grey.shade300,),
                  SizedBox(width: 10),
                  Text('Cari barang disini...', style: TextConstant.medium.copyWith(color:Colors.grey.shade300, fontSize: 13),)
                ],
              ),
              // child: TextField(
              //   enabled: false,
              //   decoration: InputDecoration(
              //     prefixIcon: Icon(CupertinoIcons.search, color: Colors.grey.shade300,),
              //     border: InputBorder.none,
              //     contentPadding: EdgeInsets.only(top: 7),
              //   ),
              // ),
            ),
          )
        ],
      ),
    ));
  }
}
