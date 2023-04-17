import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokoonline/controller/checkout/checkout_controller.dart';
import 'package:tokoonline/widget/appbar_widget.dart';
import 'package:tokoonline/widget/payment/metode_payment_widget.dart';

class ListPaymentScreen extends StatelessWidget {
  const ListPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = CheckoutController();
    controller.getPaymentList();
    return Scaffold(
      appBar: AppBarWidget(title: 'Metode Pengiriman'),
      body: Obx(()=>Container(
        child: ListView.builder(
          itemCount: controller.dataPayment.value.length,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          itemBuilder: (context, index){
            return MetodePaymentWidget(data: controller.dataPayment.value[index]);
          },
        ),
      )),
    );
  }
}
