import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrscan_for_restaurant/ordermunupage.dart';

/** 2022-06-16 jongdroid
 *  null check 작업 필요
 *  장바구니에 담은 음식들 확인할 수 있도록 구현 필요
 */

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}
class _BasketPageState extends State<BasketPage> {

  var foodNameList = Get.arguments;
  List<String?> dataList = ['비어있습니다.'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('장바구니 화면'),
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: (){
              Get.back();
            },
          ),
          centerTitle: true,
        ),
        body: Center(
            child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, int index) {
                  dataList[index] = foodNameList;
                  print('datalist ${dataList[index]}');
                  return ListTile(
                    title: Text('${dataList[index]}'),
                  );
                })),
          ),
      );
  }
}
