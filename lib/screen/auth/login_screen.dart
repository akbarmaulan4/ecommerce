import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tokoonline/constant/decoration_constant.dart';
import 'package:tokoonline/constant/dialog_constant.dart';
import 'package:tokoonline/constant/image_constant.dart';
import 'package:tokoonline/constant/text_constant.dart';
import 'package:tokoonline/controller/auth_controller.dart';
import 'package:tokoonline/model/auth/model_user.dart';
import 'package:tokoonline/screen/auth/forgot_password_screen.dart';
import 'package:tokoonline/screen/auth/register_screen.dart';
import 'package:tokoonline/screen/home/main_home.dart';
import 'package:tokoonline/utils/local_data.dart';
import 'package:tokoonline/widget/material/button_green_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AuthController controller = new AuthController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // clearCart();
  }

  clearCart(){
    LocalData.removeAllPreference();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(()=>Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.10),
              Center(child: Image.asset(ImageConstant.cart_logo, height: size.height * 0.30)),
              SizedBox(height: 45),
              Text('Login', style: TextConstant.regular.copyWith(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black87),),
              SizedBox(height: 45),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.phone_android_rounded, size: 24, color: Colors.grey.shade400),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        child: TextField(
                          controller: controller.edtNohp,
                          maxLength: 25,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(12),
                            FilteringTextInputFormatter.deny(RegExp('[\\-|\\,|\\.|\\#|\\*]'))
                          ],
                          decoration: DecorationConstant.inputDecor().copyWith(hintText: "Masukkan nomor teleponmu",counterText: '', contentPadding: EdgeInsets.only(top: 0)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.https, size: 24, color: Colors.grey.shade400,),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        child: TextField(
                          maxLength: 25,
                          controller: controller.edtPass,
                          obscureText: controller.openPassLogin.value,
                          decoration: DecorationConstant.inputDecor().
                          copyWith(
                            hintText: "Masukkan Kata Sandi",
                            counterText: '',
                            contentPadding: EdgeInsets.only(top: 10),
                            suffixIcon: GestureDetector(
                                onTap: ()=>controller.changeOpenPassLogin(!controller.openPassLogin.value),
                                child: Icon(controller.openPassLogin.value ? CupertinoIcons.eye_slash:CupertinoIcons.eye, size: 20, color: Colors.grey.shade400,)
                            ),
                            suffixIconColor: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap:()=>Get.to(()=>ForgotPasswordScreen()),
                        child: Text('Lupa Kata Sandi?', style: TextConstant.regular.copyWith(fontWeight: FontWeight.bold, color: Colors.green),)
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonGreenWidget(text: 'Submit', onClick: ()=>controller.validation(
                    context: context,
                    callback: (result, error){
                      if(result != null){
                        if(result['error'] == true){
                          DialogConstant.alertError(result['message']);
                        }else{
                          ModelUser user = ModelUser.fromJson(result['data'][0]);
                          LocalData.saveData('user', jsonEncode(user));
                          Get.to(()=>MainHome());
                        }

                      }else{
                        DialogConstant.alertError('Maaf ada kesalahan');
                      }
                    }
                  ),)
              ),
              SizedBox(height: 15),
              Center(
                child: GestureDetector(
                  onTap: ()=>Get.to(()=>RegisterScreen()),
                  child: RichText(
                    text: TextSpan(
                      text: 'Belum punya akun ? Daftar',
                      style: TextConstant.regular,
                      children: <TextSpan>[
                        TextSpan(text: ' Disini', style: TextConstant.regular.copyWith(
                            color: Colors.green
                        )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
