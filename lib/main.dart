import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';

/** 2022-05-29 23:13PM jongdroid-개발시작
 * 매장내 테이블에 QR코드가 부착되어있음을 전제로 합니다.
 * QR코드 인식을 통해 가장 먼저 테이블 번호를 불러옵니다.
 * 이후 다음 버튼을 통해 메뉴 주문 등과 같은 이벤트를 실행할 수 있으며
 * 기능은 점차 추가할 예정입니다. ( *실제 주문은 불가능합니다.)
 */

var ranTableNum = Random().nextInt(10)+1;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      appBar: AppBar(title: Text('QR코드를 스캔해보세요.'),
      centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: '$ranTableNum번 테이블입니다. 다음 버튼으로 메뉴를 주문해보세요.',
              backgroundColor: Colors.white,
              size: 200,
            ),
            ElevatedButton(onPressed: (){}, child: Text('다음으로')),
          ],
        ),
      )
    );
  }
}