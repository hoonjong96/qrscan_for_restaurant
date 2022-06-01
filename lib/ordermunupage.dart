import 'package:flutter/material.dart';
import 'package:get/get.dart';

/** 2022-06-01 23:22 jongdroid
 * 해당 페이지는 메인 페이지에서 큐알 스캔을 통해 받아온 테이블 번호로 메뉴 주문하는 페이지 입니다.
 */

class OrderMenuPage extends StatefulWidget {
  const OrderMenuPage({Key? key}) : super(key: key);

  @override
  State<OrderMenuPage> createState() => _OrderMenuPageState();
}

class _OrderMenuPageState extends State<OrderMenuPage> {
  var tableNum = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('$tableNum번 테아블 입니다.'),
        centerTitle: true,
        ),
      ),
    );
  }
}
