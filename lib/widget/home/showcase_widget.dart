import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/image_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/controller/home/home_controller.dart';

class ShowCaseWidget extends StatefulWidget {
  const ShowCaseWidget({Key? key}) : super(key: key);

  @override
  State<ShowCaseWidget> createState() => _ShowCaseWidgetState();
}

class _ShowCaseWidgetState extends State<ShowCaseWidget> {

  RxInt indexPage = 0.obs;
  HomeController controller = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getBanner(context: context);
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16/9,
                  height: 270,
                  autoPlay: true,
                  viewportFraction: 1,
                  // enlargeCenterPage: true,
                  onPageChanged: (index, value){
                    indexPage.value = index;
                  }
                ),
                items: controller.dataBanner.value.map((promo) {
                  return GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      height: 270,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: DecorationConstant.boxButton(radius: 8, color: Colors.white),
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: promo!.image!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) => Image.asset(ImageConstant.cart_logo),
                          errorWidget: (context, url, error) => Image.asset(ImageConstant.cart_logo)
                      ),
                    ),
                  );
                }).toList()
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller.dataBanner.value.asMap().map((index, value) => MapEntry(index, Container(
                        width: 8.0,height: 8.0,
                        margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 2.0),
                        decoration: DecorationConstant.boxCircle(color: indexPage.value == index ? Colors.green : Colors.grey.shade400 )
                      ))).values.toList(),
                    ),
                    GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 4, bottom: 12),
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text('Lihat Semua',
                              style: TextConstant.medium.copyWith(color: Colors.green)
                          )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
