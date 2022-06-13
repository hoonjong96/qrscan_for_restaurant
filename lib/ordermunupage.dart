import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrscan_for_restaurant/basketPage.dart';

/** 2022-06-01 23:22 jongdroid
 * 해당 페이지는 블 번메인 페이지에서 큐알 스캔을 통해 받아온 테이호로 메뉴를 주문하는 페이지 입니다. (실제 매장 주문 불가)
 * 상태관리 학습을 위한 프로젝트로 장바구니 기능을 추가할 예정입니다.

 * [2022-06-14] 장바구니에 저장한 아이템 리스트를 장바구니에서 볼 수 있도록 수정중 입니다.
 */

class OrderMenuPage extends StatefulWidget {
  const OrderMenuPage({Key? key}) : super(key: key);

  @override
  State<OrderMenuPage> createState() => _OrderMenuPageState();
}

class _OrderMenuPageState extends State<OrderMenuPage> {
  int tableNum = Get.arguments; //main으로 부터 얻어온 테이블 번호

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('$tableNum번 테이블 입니다.'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                setState(() {
                  // 카트 클릭시 장바구니 페이지로 전환 예정
                  Get.to(() => BasketPage());
                });
              },
              color: Colors.red,),
          ],
          centerTitle: true,
        ),
        body: Container(
          child: MenuList(),
        ),
      ),
    );
  }
}

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {

  // 리스트 제목 = 음식 이름
  List<String> foodNameList = ['짜장면', '짬뽕', '볶음밥', '짬짜면',  '탕수육' ];
  // 리스트 부제목 = prize
  List<int> foodPrizeList = [200, 300, 200, 300, 500];
  // leading = 음식 image
  var foodImageList = ['image1.jpeg', 'image2.jpeg', 'image3.jpeg', 'image4.jpeg', 'image5.jpeg' ];

  bool checkCartItem = false;

  List<Icon> item = [Icon(Icons.remove_shopping_cart), Icon(Icons.remove_shopping_cart), Icon(Icons.remove_shopping_cart), Icon(Icons.remove_shopping_cart) , Icon(Icons.remove_shopping_cart)];

  List<String> saveData = ['텅 비었습니다.'];

  List<String> saveData2 = [''];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: foodNameList.length,
      itemBuilder: (context, int index) {
        return ListTile(
          title: Text( '${foodNameList[index]}'),
          subtitle: Text( '${foodPrizeList[index]}원'),
          leading: SizedBox( width: 45, height: 45,
              child: Image.asset('image/${foodImageList[index]}')
          ),
          trailing: item[index],
          onTap: () {
            setState(() {
              checkCartItem =! checkCartItem;

              if (checkCartItem == true) {
                item[index] = Icon(Icons.shopping_cart, color: Colors.red,);
                // Get.to(() => BasketPage(), arguments: foodNameList[index]);
                // Get.to(() => BasketPage(), arguments: foodPrizeList[index]);
                print('order : ${foodNameList[index]}');
              }
              else if(checkCartItem == false) {
                item[index] = Icon(Icons.remove_shopping_cart);
              }
            });
          },
        );
      },
      separatorBuilder: (context, int index) => Divider(),
    );
  }
}
