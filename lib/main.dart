import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';
import 'package:qrscan_for_restaurant/ordermunupage.dart';
import 'package:get/get.dart';

/** 2022-05-29 23:13PM jongdroid-개발시작
 * 매장내 테이블에 QR코드가 부착되어있음을 전제로 합니다.
 * QR코드 인식을 통해 가장 먼저 테이블 번호를 불러옵니다.
 * 이후 다음 버튼을 통해 메뉴 주문 등과 같은 이벤트를 실행할 수 있으며
 * 기능은 점차 추가할 예정입니다. ( *실제 주문은 불가능합니다.)
 */

var tableNum = Random().nextInt(10) + 1;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('QR코드를 스캔해보세요.'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: '$tableNum번 테이블입니다. 다음 버튼으로 메뉴를 주문해보세요.',
                backgroundColor: Colors.white,
                size: 200,
              ),
              // 큐알코드를 통해 테이블 번호 정보를 스캔하고 다음페이지에서 본격적인 주문을 할 수 있습니다.

              ElevatedButton(
                  child: Text('다음으로'),
                  onPressed: () {
                    //Navigator를 사용하여 화면 전환을 할 수 있지만 Get을 사용하여 더욱 간소화된 코드로 구현할 수 있습니다.
                    Get.to(() => OrderMenuPage());
                    Get.to(() => OrderMenuPage(), arguments: tableNum);
                    print('$tableNum 번 테이블');
                  },
                ),
            ],
          ),
        ));
  }
}
