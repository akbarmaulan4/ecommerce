import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokoonline/controller/home/home_controller.dart';
import 'package:tokoonline/screen/home/view/home_screen.dart';
import 'package:tokoonline/screen/home/view/profile_screen.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  PageController controller = PageController();
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          controller: controller,
          physics: BouncingScrollPhysics(),
          children: const <Widget>[
            HomeScreen(),
            Center(
              child: Text('Second Page'),
            ),
            Center(
              child: Text('Third Page'),
            ),
            ProfileScreen(),
          ],
          onPageChanged: (val)=>homeController.changePage(val),
        ),
      ),
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Pesanan',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
            backgroundColor: Colors.green,
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade400,
        showUnselectedLabels: true,
        currentIndex: homeController.posPage.value,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        onTap: (val){
          homeController.changePage(val);
          controller.animateToPage(val, duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
        },
        // onTap: _onItemTapped,
      )),
    );
  }
}
